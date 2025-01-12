import '/auth/firebase_auth/auth_util.dart';
import '/components/page_bg/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'setting_screen_widget.dart' show SettingScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingScreenModel extends FlutterFlowModel<SettingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for page_bg component.
  late PageBgModel pageBgModel;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
  }
}
