import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginEmailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailLogin widget.
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  // State field(s) for passLogin widget.
  TextEditingController? passLoginController;
  late bool passLoginVisibility;
  String? Function(BuildContext, String?)? passLoginControllerValidator;
  // State field(s) for emailRegi widget.
  TextEditingController? emailRegiController;
  String? Function(BuildContext, String?)? emailRegiControllerValidator;
  // State field(s) for PRegi widget.
  TextEditingController? pRegiController;
  late bool pRegiVisibility;
  String? Function(BuildContext, String?)? pRegiControllerValidator;
  // State field(s) for CPRegi widget.
  TextEditingController? cPRegiController;
  late bool cPRegiVisibility;
  String? Function(BuildContext, String?)? cPRegiControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passLoginVisibility = false;
    pRegiVisibility = false;
    cPRegiVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailLoginController?.dispose();
    passLoginController?.dispose();
    emailRegiController?.dispose();
    pRegiController?.dispose();
    cPRegiController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
