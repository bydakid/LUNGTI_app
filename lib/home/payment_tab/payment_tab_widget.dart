import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/order_confirmation/order_confirmation_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_tab_model.dart';
export 'payment_tab_model.dart';

class PaymentTabWidget extends StatefulWidget {
  const PaymentTabWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final StoreRecord? user;

  @override
  _PaymentTabWidgetState createState() => _PaymentTabWidgetState();
}

class _PaymentTabWidgetState extends State<PaymentTabWidget> {
  late PaymentTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentTabModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.user?.location?.name,
                  'name',
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.access_time_filled,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 20.0,
                      ),
                    ),
                    RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '2l8lntgg' /* Collect today at  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                widget.user?.bag?.timeStart,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'time',
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '7lmy1p1e' /*  -  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                widget.user?.bag?.timeEnd,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'time',
                            ),
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'peq39l92' /* Quantity */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          width: 160.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.minus,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).secondaryText
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            incrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.plus,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            count: _model.countControllerValue ??= 1,
                            updateCount: (count) => setState(
                                () => _model.countControllerValue = count),
                            stepSize: 1,
                            minimum: 1,
                            maximum: 1,
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '96hxxtyz' /* By reserving this meal you agr... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PAYMENT_TAB_COMP_Text_yui6wlr2_ON_TAP');
                            logFirebaseEvent('Text_launch_u_r_l');
                            await launchURL(
                                'https://lungti.com/termsconditions.html');
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'x7nhbtno' /* Terms and Conditions */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'eamqlcqb' /* Total */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: Text(
                          formatNumber(
                            widget.user!.bag.priceInt,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    if (widget.user?.country == 'Malaysia')
                      Text(
                        FFLocalizations.of(context).getText(
                          '1it3v9dv' /*  RM */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    if (widget.user?.country == 'Singapore')
                      Text(
                        FFLocalizations.of(context).getText(
                          '45j2sx9q' /*  S$ */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    if (widget.user?.country == 'Philippines')
                      Text(
                        FFLocalizations.of(context).getText(
                          'tyuovgo2' /*  PHP */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '4qwk1bkx' /* Payment Method */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              if (widget.user?.country == 'Philippines')
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!.user!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final phpUserRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PAYMENT_TAB_COMP_php_ON_TAP');
                            if (valueOrDefault(
                                    currentUserDocument?.wallet, 0.0) >=
                                widget.user!.bag.priceInt) {
                              logFirebaseEvent('php_backend_call');

                              var ordersRecordReference =
                                  OrdersRecord.collection.doc();
                              await ordersRecordReference
                                  .set(createOrdersRecordData(
                                quantity: _model.countControllerValue,
                                pickedUp: false,
                                userRef: currentUserReference,
                                storeRefx: widget.user?.reference,
                                store: phpUserRecord.reference,
                                time: getCurrentTimestamp,
                                numberOrder: widget.user?.bag?.sold,
                              ));
                              _model.orderNumber2 =
                                  OrdersRecord.getDocumentFromData(
                                      createOrdersRecordData(
                                        quantity: _model.countControllerValue,
                                        pickedUp: false,
                                        userRef: currentUserReference,
                                        storeRefx: widget.user?.reference,
                                        store: phpUserRecord.reference,
                                        time: getCurrentTimestamp,
                                        numberOrder: widget.user?.bag?.sold,
                                      ),
                                      ordersRecordReference);
                              logFirebaseEvent('php_backend_call');

                              await widget.user!.reference.update({
                                ...createStoreRecordData(
                                  bag: createBagStruct(
                                    fieldValues: {
                                      'amount': FieldValue.increment(
                                          -(_model.countControllerValue!)),
                                      'sold': FieldValue.increment(1),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ),
                                'total_earnings': FieldValue.increment(
                                    widget.user!.bag.priceInt),
                                'next_bag_amounth': FieldValue.increment(
                                    _model.countControllerValue!),
                                'fianl_payout': FieldValue.increment(
                                    functions.finalPayPHP(
                                        widget.user!.bag.priceInt.toDouble())),
                              });
                              logFirebaseEvent('php_backend_call');

                              await currentUserReference!.update({
                                'wallet': FieldValue.increment(
                                    -(widget.user!.bag.priceInt.toDouble())),
                                'co2':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.co2,
                                  0.0,
                                )),
                                'food_kg':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.foodWeight,
                                  0.0,
                                )),
                                'money_saved':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.moneySaved,
                                  0.0,
                                )),
                              });
                              logFirebaseEvent('php_trigger_push_notification');
                              triggerPushNotification(
                                notificationTitle: 'New Order!',
                                notificationText:
                                    'A hungry heart has booked your mystery bag! 🥳 Prepare the goodies and have them ready for the scheduled pickup time.',
                                notificationSound: 'default',
                                userRefs: [widget.user!.user!],
                                initialPageName: 'home',
                                parameterData: {},
                              );
                              logFirebaseEvent('php_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: OrderConfirmationWidget(
                                      order: _model.orderNumber2!,
                                      store: widget.user!,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            } else {
                              logFirebaseEvent('php_navigate_to');

                              context.pushNamed('Payment');
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'xlhs6xea' /* Lungti Pay */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.solidMoneyBillAlt,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          showLoadingIndicator: false,
                        );
                      },
                    ),
                  ),
                ),
              if (widget.user?.country == 'Malaysia')
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!.user!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final rmUserRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PAYMENT_TAB_COMP_rm_ON_TAP');
                            if (valueOrDefault(
                                    currentUserDocument?.wallet, 0.0) >=
                                widget.user!.bag.priceInt) {
                              logFirebaseEvent('rm_backend_call');

                              var ordersRecordReference =
                                  OrdersRecord.collection.doc();
                              await ordersRecordReference
                                  .set(createOrdersRecordData(
                                quantity: _model.countControllerValue,
                                pickedUp: false,
                                userRef: currentUserReference,
                                storeRefx: widget.user?.reference,
                                store: rmUserRecord.reference,
                                time: getCurrentTimestamp,
                                numberOrder: widget.user?.bag?.sold,
                              ));
                              _model.orderNumberLungti =
                                  OrdersRecord.getDocumentFromData(
                                      createOrdersRecordData(
                                        quantity: _model.countControllerValue,
                                        pickedUp: false,
                                        userRef: currentUserReference,
                                        storeRefx: widget.user?.reference,
                                        store: rmUserRecord.reference,
                                        time: getCurrentTimestamp,
                                        numberOrder: widget.user?.bag?.sold,
                                      ),
                                      ordersRecordReference);
                              logFirebaseEvent('rm_backend_call');

                              await widget.user!.reference.update({
                                ...createStoreRecordData(
                                  bag: createBagStruct(
                                    fieldValues: {
                                      'amount': FieldValue.increment(
                                          -(_model.countControllerValue!)),
                                      'sold': FieldValue.increment(1),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ),
                                'total_earnings': FieldValue.increment(
                                    widget.user!.bag.priceInt),
                                'next_bag_amounth': FieldValue.increment(
                                    _model.countControllerValue!),
                                'fianl_payout': FieldValue.increment(
                                    functions.finalPayRM(
                                        widget.user!.bag.priceInt.toDouble())),
                              });
                              logFirebaseEvent('rm_backend_call');

                              await currentUserReference!.update({
                                'wallet': FieldValue.increment(
                                    -(valueOrDefault<double>(
                                  widget.user?.bag?.priceInt?.toDouble(),
                                  0.0,
                                ))),
                                'co2':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.co2,
                                  0.0,
                                )),
                                'food_kg':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.foodWeight,
                                  0.0,
                                )),
                                'money_saved':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.moneySaved,
                                  0.0,
                                )),
                              });
                              logFirebaseEvent('rm_trigger_push_notification');
                              triggerPushNotification(
                                notificationTitle: 'New Order!',
                                notificationText:
                                    'A hungry heart has booked your mystery bag! 🥳 Prepare the goodies and have them ready for the scheduled pickup time.',
                                notificationSound: 'default',
                                userRefs: [widget.user!.user!],
                                initialPageName: 'home',
                                parameterData: {},
                              );
                              logFirebaseEvent('rm_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: OrderConfirmationWidget(
                                      order: _model.orderNumberLungti!,
                                      store: widget.user!,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            } else {
                              logFirebaseEvent('rm_navigate_to');

                              context.pushNamed('Payment');
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'etqsf4xg' /* Lungti Pay */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.solidMoneyBillAlt,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          showLoadingIndicator: false,
                        );
                      },
                    ),
                  ),
                ),
              if (widget.user?.country == 'Singapore')
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!.user!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final sgUserRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PAYMENT_TAB_COMP_sg_ON_TAP');
                            if (valueOrDefault(
                                    currentUserDocument?.wallet, 0.0) >=
                                widget.user!.bag.priceInt) {
                              logFirebaseEvent('sg_backend_call');

                              var ordersRecordReference =
                                  OrdersRecord.collection.doc();
                              await ordersRecordReference
                                  .set(createOrdersRecordData(
                                quantity: _model.countControllerValue,
                                pickedUp: false,
                                userRef: currentUserReference,
                                storeRefx: widget.user?.reference,
                                store: sgUserRecord.reference,
                                time: getCurrentTimestamp,
                                numberOrder: widget.user?.bag?.sold,
                              ));
                              _model.orderNumberSgp1 =
                                  OrdersRecord.getDocumentFromData(
                                      createOrdersRecordData(
                                        quantity: _model.countControllerValue,
                                        pickedUp: false,
                                        userRef: currentUserReference,
                                        storeRefx: widget.user?.reference,
                                        store: sgUserRecord.reference,
                                        time: getCurrentTimestamp,
                                        numberOrder: widget.user?.bag?.sold,
                                      ),
                                      ordersRecordReference);
                              logFirebaseEvent('sg_backend_call');

                              await widget.user!.reference.update({
                                ...createStoreRecordData(
                                  bag: createBagStruct(
                                    fieldValues: {
                                      'amount': FieldValue.increment(
                                          -(_model.countControllerValue!)),
                                      'sold': FieldValue.increment(1),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ),
                                'total_earnings': FieldValue.increment(
                                    widget.user!.bag.priceInt),
                                'next_bag_amounth': FieldValue.increment(
                                    _model.countControllerValue!),
                                'fianl_payout': FieldValue.increment(
                                    functions.finalPatSGD(
                                        widget.user!.bag.priceInt.toDouble())),
                              });
                              logFirebaseEvent('sg_backend_call');

                              await currentUserReference!.update({
                                'wallet': FieldValue.increment(
                                    -(valueOrDefault<double>(
                                  widget.user?.bag?.priceInt?.toDouble(),
                                  0.0,
                                ))),
                                'co2':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.co2,
                                  0.0,
                                )),
                                'food_kg':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.foodWeight,
                                  0.0,
                                )),
                                'money_saved':
                                    FieldValue.increment(valueOrDefault<double>(
                                  widget.user?.bag?.moneySaved,
                                  0.0,
                                )),
                              });
                              logFirebaseEvent('sg_trigger_push_notification');
                              triggerPushNotification(
                                notificationTitle: 'New Order!',
                                notificationText:
                                    'A hungry heart has booked your mystery bag! 🥳 Prepare the goodies and have them ready for the scheduled pickup time.',
                                notificationSound: 'default',
                                userRefs: [widget.user!.user!],
                                initialPageName: 'home',
                                parameterData: {},
                              );
                              logFirebaseEvent('sg_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: OrderConfirmationWidget(
                                      order: _model.orderNumberSgp1!,
                                      store: widget.user!,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            } else {
                              logFirebaseEvent('sg_navigate_to');

                              context.pushNamed('Payment');
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '06k6r1hh' /* Lungti Pay */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.solidMoneyBillAlt,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          showLoadingIndicator: false,
                        );
                      },
                    ),
                  ),
                ),
              if (widget.user?.country == 'Philippines')
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!.user!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final phpUserRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PAYMENT_TAB_COMP_php_ON_TAP');
                            logFirebaseEvent('php_stripe_payment');
                            final paymentResponse = await processStripePayment(
                              context,
                              amount: functions
                                  .centStripe00(
                                      widget.user!.bag.priceInt.toDouble())
                                  .round(),
                              currency: 'PHP',
                              customerEmail: currentUserEmail,
                              description: 'Lungti : Mystery Bag',
                              allowGooglePay: true,
                              allowApplePay: false,
                              themeStyle: ThemeMode.dark,
                              buttonColor:
                                  FlutterFlowTheme.of(context).secondary,
                              buttonTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            );
                            if (paymentResponse.paymentId == null) {
                              if (paymentResponse.errorMessage != null) {
                                showSnackbar(
                                  context,
                                  'Error: ${paymentResponse.errorMessage}',
                                );
                              }
                              return;
                            }
                            _model.paymentId = paymentResponse.paymentId!;

                            logFirebaseEvent('php_backend_call');

                            var ordersRecordReference =
                                OrdersRecord.collection.doc();
                            await ordersRecordReference
                                .set(createOrdersRecordData(
                              quantity: _model.countControllerValue,
                              pickedUp: false,
                              userRef: currentUserReference,
                              storeRefx: widget.user?.reference,
                              store: phpUserRecord.reference,
                              time: getCurrentTimestamp,
                              numberOrder: widget.user?.bag?.sold,
                            ));
                            _model.orderNumber =
                                OrdersRecord.getDocumentFromData(
                                    createOrdersRecordData(
                                      quantity: _model.countControllerValue,
                                      pickedUp: false,
                                      userRef: currentUserReference,
                                      storeRefx: widget.user?.reference,
                                      store: phpUserRecord.reference,
                                      time: getCurrentTimestamp,
                                      numberOrder: widget.user?.bag?.sold,
                                    ),
                                    ordersRecordReference);
                            logFirebaseEvent('php_backend_call');

                            await widget.user!.reference.update({
                              ...createStoreRecordData(
                                bag: createBagStruct(
                                  fieldValues: {
                                    'amount': FieldValue.increment(
                                        -(_model.countControllerValue!)),
                                    'sold': FieldValue.increment(1),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ),
                              'total_earnings': FieldValue.increment(
                                  widget.user!.bag.priceInt),
                              'next_bag_amounth': FieldValue.increment(
                                  _model.countControllerValue!),
                              'fianl_payout': FieldValue.increment(
                                  functions.finalPayPHP(
                                      widget.user!.bag.priceInt.toDouble())),
                            });
                            logFirebaseEvent('php_backend_call');

                            await currentUserReference!.update({
                              'co2':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.co2,
                                0.0,
                              )),
                              'food_kg':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.foodWeight,
                                0.0,
                              )),
                              'money_saved':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.moneySaved,
                                0.0,
                              )),
                            });
                            logFirebaseEvent('php_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle: 'New Order!',
                              notificationText:
                                  'A hungry heart has booked your mystery bag! 🥳 Prepare the goodies and have them ready for the scheduled pickup time.',
                              notificationSound: 'default',
                              userRefs: [widget.user!.user!],
                              initialPageName: 'home',
                              parameterData: {},
                            );
                            logFirebaseEvent('php_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: OrderConfirmationWidget(
                                    order: _model.orderNumber!,
                                    store: widget.user!,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'mf10juoq' /* Credit/Debit Card  */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.creditCard,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          showLoadingIndicator: false,
                        );
                      },
                    ),
                  ),
                ),
              if (widget.user?.country == 'Singapore')
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!.user!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final sgUserRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PAYMENT_TAB_COMP_sg_ON_TAP');
                            logFirebaseEvent('sg_stripe_payment');
                            final paymentResponse = await processStripePayment(
                              context,
                              amount: functions
                                  .centStripe00(
                                      widget.user!.bag.priceInt.toDouble())
                                  .round(),
                              currency: 'SGD',
                              customerEmail: currentUserEmail,
                              description: 'Lungti : Mystery Bag',
                              allowGooglePay: true,
                              allowApplePay: false,
                              themeStyle: ThemeMode.dark,
                              buttonColor:
                                  FlutterFlowTheme.of(context).secondary,
                              buttonTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            );
                            if (paymentResponse.paymentId == null) {
                              if (paymentResponse.errorMessage != null) {
                                showSnackbar(
                                  context,
                                  'Error: ${paymentResponse.errorMessage}',
                                );
                              }
                              return;
                            }
                            _model.paymentIdSG = paymentResponse.paymentId!;

                            logFirebaseEvent('sg_backend_call');

                            var ordersRecordReference =
                                OrdersRecord.collection.doc();
                            await ordersRecordReference
                                .set(createOrdersRecordData(
                              quantity: _model.countControllerValue,
                              pickedUp: false,
                              userRef: currentUserReference,
                              storeRefx: widget.user?.reference,
                              store: sgUserRecord.reference,
                              time: getCurrentTimestamp,
                              numberOrder: widget.user?.bag?.sold,
                            ));
                            _model.orderNumberSG =
                                OrdersRecord.getDocumentFromData(
                                    createOrdersRecordData(
                                      quantity: _model.countControllerValue,
                                      pickedUp: false,
                                      userRef: currentUserReference,
                                      storeRefx: widget.user?.reference,
                                      store: sgUserRecord.reference,
                                      time: getCurrentTimestamp,
                                      numberOrder: widget.user?.bag?.sold,
                                    ),
                                    ordersRecordReference);
                            logFirebaseEvent('sg_backend_call');

                            await widget.user!.reference.update({
                              ...createStoreRecordData(
                                bag: createBagStruct(
                                  fieldValues: {
                                    'amount': FieldValue.increment(
                                        -(_model.countControllerValue!)),
                                    'sold': FieldValue.increment(1),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ),
                              'total_earnings': FieldValue.increment(
                                  widget.user!.bag.priceInt),
                              'next_bag_amounth': FieldValue.increment(
                                  _model.countControllerValue!),
                              'fianl_payout': FieldValue.increment(
                                  functions.finalPatSGD(
                                      widget.user!.bag.priceInt.toDouble())),
                            });
                            logFirebaseEvent('sg_backend_call');

                            await currentUserReference!.update({
                              'co2':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.co2,
                                0.0,
                              )),
                              'food_kg':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.foodWeight,
                                0.0,
                              )),
                              'money_saved':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.moneySaved,
                                0.0,
                              )),
                            });
                            logFirebaseEvent('sg_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle: 'New Order!',
                              notificationText:
                                  'A hungry heart has booked your mystery bag! 🥳 Prepare the goodies and have them ready for the scheduled pickup time.',
                              notificationSound: 'default',
                              userRefs: [widget.user!.user!],
                              initialPageName: 'home',
                              parameterData: {},
                            );
                            logFirebaseEvent('sg_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: OrderConfirmationWidget(
                                    order: _model.orderNumberSG!,
                                    store: widget.user!,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '3nrupc06' /* Credit/Debit Card  */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.creditCard,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          showLoadingIndicator: false,
                        );
                      },
                    ),
                  ),
                ),
              if (widget.user?.country == 'Malaysia')
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!.user!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final rmUserRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('PAYMENT_TAB_COMP_rm_ON_TAP');
                            logFirebaseEvent('rm_stripe_payment');
                            final paymentResponse = await processStripePayment(
                              context,
                              amount: functions
                                  .centStripe00(
                                      widget.user!.bag.priceInt.toDouble())
                                  .round(),
                              currency: 'MYR',
                              customerEmail: currentUserEmail,
                              description: 'Lungti : Mystery Bag',
                              allowGooglePay: true,
                              allowApplePay: false,
                              themeStyle: ThemeMode.dark,
                              buttonColor:
                                  FlutterFlowTheme.of(context).secondary,
                              buttonTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            );
                            if (paymentResponse.paymentId == null) {
                              if (paymentResponse.errorMessage != null) {
                                showSnackbar(
                                  context,
                                  'Error: ${paymentResponse.errorMessage}',
                                );
                              }
                              return;
                            }
                            _model.paymentIdMYR = paymentResponse.paymentId!;

                            logFirebaseEvent('rm_backend_call');

                            var ordersRecordReference =
                                OrdersRecord.collection.doc();
                            await ordersRecordReference
                                .set(createOrdersRecordData(
                              quantity: _model.countControllerValue,
                              pickedUp: false,
                              userRef: currentUserReference,
                              storeRefx: widget.user?.reference,
                              store: rmUserRecord.reference,
                              time: getCurrentTimestamp,
                              numberOrder: widget.user?.bag?.sold,
                            ));
                            _model.orderNumberRM =
                                OrdersRecord.getDocumentFromData(
                                    createOrdersRecordData(
                                      quantity: _model.countControllerValue,
                                      pickedUp: false,
                                      userRef: currentUserReference,
                                      storeRefx: widget.user?.reference,
                                      store: rmUserRecord.reference,
                                      time: getCurrentTimestamp,
                                      numberOrder: widget.user?.bag?.sold,
                                    ),
                                    ordersRecordReference);
                            logFirebaseEvent('rm_backend_call');

                            await widget.user!.reference.update({
                              ...createStoreRecordData(
                                bag: createBagStruct(
                                  fieldValues: {
                                    'amount': FieldValue.increment(
                                        -(_model.countControllerValue!)),
                                    'sold': FieldValue.increment(1),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ),
                              'total_earnings': FieldValue.increment(
                                  widget.user!.bag.priceInt),
                              'next_bag_amounth': FieldValue.increment(
                                  _model.countControllerValue!),
                              'fianl_payout': FieldValue.increment(
                                  functions.finalPayRM(
                                      widget.user!.bag.priceInt.toDouble())),
                            });
                            logFirebaseEvent('rm_backend_call');

                            await currentUserReference!.update({
                              'co2':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.co2,
                                0.0,
                              )),
                              'food_kg':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.foodWeight,
                                0.0,
                              )),
                              'money_saved':
                                  FieldValue.increment(valueOrDefault<double>(
                                widget.user?.bag?.moneySaved,
                                0.0,
                              )),
                            });
                            logFirebaseEvent('rm_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle: 'New Order!',
                              notificationText:
                                  'A hungry heart has booked your mystery bag! 🥳 Prepare the goodies and have them ready for the scheduled pickup time.',
                              notificationSound: 'default',
                              userRefs: [widget.user!.user!],
                              initialPageName: 'home',
                              parameterData: {},
                            );
                            logFirebaseEvent('rm_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: OrderConfirmationWidget(
                                    order: _model.orderNumberRM!,
                                    store: widget.user!,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'ho90zezz' /* Credit/Debit Card  */,
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.creditCard,
                            color: Colors.white,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          showLoadingIndicator: false,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
