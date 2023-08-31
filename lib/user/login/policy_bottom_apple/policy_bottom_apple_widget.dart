import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'policy_bottom_apple_model.dart';
export 'policy_bottom_apple_model.dart';

class PolicyBottomAppleWidget extends StatefulWidget {
  const PolicyBottomAppleWidget({Key? key}) : super(key: key);

  @override
  _PolicyBottomAppleWidgetState createState() =>
      _PolicyBottomAppleWidgetState();
}

class _PolicyBottomAppleWidgetState extends State<PolicyBottomAppleWidget> {
  late PolicyBottomAppleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PolicyBottomAppleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'POLICY_BOTTOM_APPLE_Icon_ij317kfy_ON_TAP');
                      logFirebaseEvent('Icon_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 25.0,
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue1 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.checkboxValue1 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'POLICY_BOTTOM_APPLE_RichText_spmzxa1v_ON');
                            logFirebaseEvent('RichText_launch_u_r_l');
                            await launchURL(
                                'https://lungti.com/termsconditions.html');
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'kh1swl77' /* I accept the  */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '635dv1bb' /* Terms & Conditions. */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontStyle: FontStyle.italic,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue2 ??= true,
                            onChanged: (newValue) async {
                              setState(() => _model.checkboxValue2 = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'POLICY_BOTTOM_APPLE_RichText_v7fsppen_ON');
                              logFirebaseEvent('RichText_launch_u_r_l');
                              await launchURL(
                                  'https://lungti.com/privacypolicy.html');
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '1hgkml4l' /* I accept the  */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '7h6c7owh' /* Privacy Pocily. */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontStyle: FontStyle.italic,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                isAndroid
                    ? Container()
                    : Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: !(_model.checkboxValue1! &&
                                  _model.checkboxValue2!)
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'POLICY_BOTTOM_APPLE_CONTINUE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithApple(context);
                                  if (user == null) {
                                    return;
                                  }
                                  if (valueOrDefault(
                                              currentUserDocument?.country,
                                              '') !=
                                          null &&
                                      valueOrDefault(
                                              currentUserDocument?.country,
                                              '') !=
                                          '') {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamedAuth(
                                        'Info', context.mounted);
                                  } else {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamedAuth(
                                        'Login_Country', context.mounted);
                                  }
                                },
                          text: FFLocalizations.of(context).getText(
                            'ruyhutj1' /* Continue */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
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
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).tertiary,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).secondaryText,
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
