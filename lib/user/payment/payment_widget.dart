import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_model.dart';
export 'payment_model.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late PaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Payment'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PAYMENT_PAGE_Icon_5xbajxdw_ON_TAP');
                          logFirebaseEvent('Icon_navigate_to');

                          context.pushNamed('Profiel');
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'lj1cmh5q' /* Lungti Pay */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 25.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        valueOrDefault<String>(
                          formatNumber(
                            valueOrDefault(currentUserDocument?.wallet, 0.0),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          ),
                          '0',
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    if (valueOrDefault(currentUserDocument?.country, '') ==
                        'Singapore')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 0.0, 40.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            FFLocalizations.of(context).getText(
                              'z2niklrd' /*  S$ */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    if (valueOrDefault(currentUserDocument?.country, '') ==
                        'Malaysia')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 0.0, 40.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            FFLocalizations.of(context).getText(
                              'i76ygt3s' /*  RM */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    if (valueOrDefault(currentUserDocument?.country, '') ==
                        'Philippines')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 0.0, 40.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            FFLocalizations.of(context).getText(
                              'bi5d2ezs' /*  PHP */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 30.0,
                              height: 30.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/LUNGTi._(4).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '612w4j5s' /* Preload funds and save time wi... */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '3za8q7x5' /* Top Up: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                if (valueOrDefault(currentUserDocument?.country, '') ==
                    'Philippines')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 40.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.ph1Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.ph1Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_ph1_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'ph1_set_form_field');
                                              setState(() {
                                                _model.ph1Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'ph1_reset_form_fields');
                                              setState(() {
                                                _model.ph3Value = false;
                                                _model.ph2Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'ph1_update_app_state');
                                              setState(() {
                                                FFAppState().price = 300;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '7x5lj3qv' /* 300 PHP */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.ph2Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.ph2Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_ph2_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'ph2_set_form_field');
                                              setState(() {
                                                _model.ph2Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'ph2_reset_form_fields');
                                              setState(() {
                                                _model.ph3Value = false;
                                                _model.ph1Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'ph2_update_app_state');
                                              setState(() {
                                                FFAppState().price = 500;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '9m38fsw7' /* 500 PHP */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.ph3Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.ph3Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_ph3_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'ph3_set_form_field');
                                              setState(() {
                                                _model.ph2Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'ph3_reset_form_fields');
                                              setState(() {
                                                _model.ph1Value = false;
                                                _model.ph2Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'ph3_update_app_state');
                                              setState(() {
                                                FFAppState().price = 1000;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '3m7xisus' /* 1000 PHP */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.country, '') ==
                    'Singapore')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 40.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.sg1Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.sg1Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_sg1_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'sg1_set_form_field');
                                              setState(() {
                                                _model.ph1Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'sg1_reset_form_fields');
                                              setState(() {
                                                _model.sg2Value = false;
                                                _model.sg3Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'sg1_update_app_state');
                                              setState(() {
                                                FFAppState().price = 10;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'mrh5zijy' /* 10 S$ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.sg2Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.sg2Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_sg2_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'sg2_set_form_field');
                                              setState(() {
                                                _model.ph2Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'sg2_reset_form_fields');
                                              setState(() {
                                                _model.sg1Value = false;
                                                _model.sg3Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'sg2_update_app_state');
                                              setState(() {
                                                FFAppState().price = 20;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'o6r8i4cy' /* 20 S$ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.sg3Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.sg3Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_sg3_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'sg3_set_form_field');
                                              setState(() {
                                                _model.ph2Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'sg3_reset_form_fields');
                                              setState(() {
                                                _model.sg2Value = false;
                                                _model.sg1Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'sg3_update_app_state');
                                              setState(() {
                                                FFAppState().price = 50;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'r5u9w751' /* 50 S$ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.country, '') ==
                    'Malaysia')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 40.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.rm1Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.rm1Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_rm1_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'rm1_set_form_field');
                                              setState(() {
                                                _model.ph1Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'rm1_reset_form_fields');
                                              setState(() {
                                                _model.rm2Value = false;
                                                _model.rm3Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'rm1_update_app_state');
                                              setState(() {
                                                FFAppState().price = 30;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'tmxc1buy' /* 30 RM */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.rm2Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.rm2Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_rm2_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'rm2_set_form_field');
                                              setState(() {
                                                _model.ph2Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'rm2_reset_form_fields');
                                              setState(() {
                                                _model.rm1Value = false;
                                                _model.rm3Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'rm2_update_app_state');
                                              setState(() {
                                                FFAppState().price = 50;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'q19az8f2' /* 50 RM */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.rm3Value ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.rm3Value = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'PAYMENT_PAGE_rm3_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'rm3_set_form_field');
                                              setState(() {
                                                _model.ph2Value = true;
                                              });
                                              logFirebaseEvent(
                                                  'rm3_reset_form_fields');
                                              setState(() {
                                                _model.rm1Value = false;
                                                _model.rm2Value = false;
                                              });
                                              logFirebaseEvent(
                                                  'rm3_update_app_state');
                                              setState(() {
                                                FFAppState().price = 100;
                                              });
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'qb1d98do' /* 100 RM */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.country, '') ==
                    'Philippines')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('PAYMENT_PAGE_PHP_ON_TAP');
                          logFirebaseEvent('PHP_stripe_payment');
                          final paymentResponse = await processStripePayment(
                            context,
                            amount: functions
                                .centStripe00(FFAppState().price.toDouble())
                                .round(),
                            currency: 'PHP',
                            customerEmail: currentUserEmail,
                            description: 'Lungti : Add Funds LP',
                            allowGooglePay: true,
                            allowApplePay: false,
                            themeStyle: ThemeMode.dark,
                            buttonColor: FlutterFlowTheme.of(context).secondary,
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
                          _model.paymentIdPHP = paymentResponse.paymentId!;

                          logFirebaseEvent('PHP_backend_call');

                          await currentUserReference!.update({
                            'wallet': FieldValue.increment(
                                FFAppState().price.toDouble()),
                          });

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'r4s7sh2d' /* Add Funds */,
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 0.0, 40.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.country, '') ==
                    'Singapore')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('PAYMENT_PAGE_SG_ON_TAP');
                          logFirebaseEvent('SG_stripe_payment');
                          final paymentResponse = await processStripePayment(
                            context,
                            amount: functions
                                .centStripe00(FFAppState().price.toDouble())
                                .round(),
                            currency: 'SGD',
                            customerEmail: currentUserEmail,
                            description: 'Lungti : Add Funds LP',
                            allowGooglePay: true,
                            allowApplePay: false,
                            themeStyle: ThemeMode.dark,
                            buttonColor: FlutterFlowTheme.of(context).secondary,
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
                          _model.paymentIdSG1 = paymentResponse.paymentId!;

                          logFirebaseEvent('SG_backend_call');

                          await currentUserReference!.update({
                            'wallet': FieldValue.increment(
                                FFAppState().price.toDouble()),
                          });

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'ayd4ndcq' /* Add Funds */,
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 0.0, 40.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.country, '') ==
                    'Malaysia')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('PAYMENT_PAGE_RM_ON_TAP');
                          logFirebaseEvent('RM_stripe_payment');
                          final paymentResponse = await processStripePayment(
                            context,
                            amount: functions
                                .centStripe00(FFAppState().price.toDouble())
                                .round(),
                            currency: 'MYR',
                            customerEmail: currentUserEmail,
                            description: 'Lungti : Add Funds LP',
                            allowGooglePay: true,
                            allowApplePay: false,
                            themeStyle: ThemeMode.dark,
                            buttonColor: FlutterFlowTheme.of(context).secondary,
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
                          _model.paymentIdMYRLP = paymentResponse.paymentId!;

                          logFirebaseEvent('RM_backend_call');

                          await currentUserReference!.update({
                            'wallet': FieldValue.increment(
                                FFAppState().price.toDouble()),
                          });

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'gy8ome6v' /* Add Funds */,
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 0.0, 40.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
