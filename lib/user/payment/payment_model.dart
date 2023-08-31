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

class PaymentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ph1 widget.
  bool? ph1Value;
  // State field(s) for ph2 widget.
  bool? ph2Value;
  // State field(s) for ph3 widget.
  bool? ph3Value;
  // State field(s) for sg1 widget.
  bool? sg1Value;
  // State field(s) for sg2 widget.
  bool? sg2Value;
  // State field(s) for sg3 widget.
  bool? sg3Value;
  // State field(s) for rm1 widget.
  bool? rm1Value;
  // State field(s) for rm2 widget.
  bool? rm2Value;
  // State field(s) for rm3 widget.
  bool? rm3Value;
  // Stores action output result for [Stripe Payment] action in PHP widget.
  String? paymentIdPHP;
  // Stores action output result for [Stripe Payment] action in SG widget.
  String? paymentIdSG1;
  // Stores action output result for [Stripe Payment] action in RM widget.
  String? paymentIdMYRLP;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
