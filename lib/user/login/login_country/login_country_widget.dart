import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_country_model.dart';
export 'login_country_model.dart';

class LoginCountryWidget extends StatefulWidget {
  const LoginCountryWidget({Key? key}) : super(key: key);

  @override
  _LoginCountryWidgetState createState() => _LoginCountryWidgetState();
}

class _LoginCountryWidgetState extends State<LoginCountryWidget> {
  late LoginCountryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCountryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Login_Country'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'mj3jgocy' /* Let's get started */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'hb8djw9v' /* Philippines */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fx0jatp1' /* Malaysia */,
                      ),
                      FFLocalizations.of(context).getText(
                        '378lzkna' /* Singapore */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: double.infinity,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      '27tg44hd' /* Choose Country */,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 0.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 10.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: FlutterFlowLanguageSelector(
                  width: double.infinity,
                  height: 50.0,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  borderColor: Colors.transparent,
                  dropdownIconColor: FlutterFlowTheme.of(context).secondaryText,
                  borderRadius: 10.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hideFlags: true,
                  flagSize: 25.0,
                  flagTextGap: 10.0,
                  currentLanguage: FFLocalizations.of(context).languageCode,
                  languages: FFLocalizations.languages(),
                  onChanged: (lang) => setAppLanguage(context, lang),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed:
                      _model.dropDownValue == null || _model.dropDownValue == ''
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'LOGIN_COUNTRY_PAGE_CONTINUE_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!
                                  .update(createUserRecordData(
                                country: _model.dropDownValue,
                              ));
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('Info');
                            },
                  text: FFLocalizations.of(context).getText(
                    'v7byc6xv' /* Continue */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Open Sans',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    disabledColor: FlutterFlowTheme.of(context).tertiary,
                    disabledTextColor:
                        FlutterFlowTheme.of(context).secondaryText,
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
