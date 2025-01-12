import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/page_bg/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'a_p_i_key_screen_widget.dart' show APIKeyScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class APIKeyScreenModel extends FlutterFlowModel<APIKeyScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for page_bg component.
  late PageBgModel pageBgModel;
  // State field(s) for api_key widget.
  FocusNode? apiKeyFocusNode;
  TextEditingController? apiKeyTextController;
  String? Function(BuildContext, String?)? apiKeyTextControllerValidator;
  String? _apiKeyTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter API Key';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? valid;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
    apiKeyTextControllerValidator = _apiKeyTextControllerValidator;
  }

  @override
  void dispose() {
    pageBgModel.dispose();
    apiKeyFocusNode?.dispose();
    apiKeyTextController?.dispose();
  }
}
