import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for name1 widget.
  TextEditingController? name1Controller;
  late bool name1Visibility;
  String? Function(BuildContext, String?)? name1ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    name1Visibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    name1Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
