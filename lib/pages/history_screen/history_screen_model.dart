import '/backend/backend.dart';
import '/components/history_item_view/history_item_view_widget.dart';
import '/components/history_loading/history_loading_widget.dart';
import '/components/page_bg/page_bg_widget.dart';
import '/components/thread_empty/thread_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'history_screen_widget.dart' show HistoryScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryScreenModel extends FlutterFlowModel<HistoryScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for page_bg component.
  late PageBgModel pageBgModel;
  // Models for HistoryItemView dynamic component.
  late FlutterFlowDynamicModels<HistoryItemViewModel> historyItemViewModels;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
    historyItemViewModels =
        FlutterFlowDynamicModels(() => HistoryItemViewModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
    historyItemViewModels.dispose();
  }
}
