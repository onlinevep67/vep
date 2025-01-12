import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/chat_item_view/chat_item_view_widget.dart';
import '/components/empty_data/empty_data_widget.dart';
import '/components/page_bg/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thread_screen_model.dart';
export 'thread_screen_model.dart';

class ThreadScreenWidget extends StatefulWidget {
  const ThreadScreenWidget({
    super.key,
    required this.collectionId,
    this.thread,
    this.question,
  });

  final int? collectionId;
  final HistoryItemsRecord? thread;
  final String? question;

  @override
  State<ThreadScreenWidget> createState() => _ThreadScreenWidgetState();
}

class _ThreadScreenWidgetState extends State<ThreadScreenWidget> {
  late ThreadScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.question != null && widget!.question != '') {
        _model.isLoading = true;
        _model.addToChatData(ChatModelStruct(
          question: widget!.question,
        ));
        safeSetState(() {});
        _model.initResponse = await EmilioLLMCall.call(
          apiToken: valueOrDefault(currentUserDocument?.apiKey, ''),
          content: widget!.question,
          oldContent: valueOrDefault<String>(
            _model.chatData
                .elementAtOrNull(
                    functions.setLastIndex(_model.chatData.toList(), 2))
                ?.answer,
            'Hello',
          ),
        );

        if ((_model.initResponse?.succeeded ?? true)) {
          var historyRecordReference =
              HistoryRecord.collection.doc(currentUserUid);
          await historyRecordReference.set(createHistoryRecordData());
          _model.initHistoryData = HistoryRecord.getDocumentFromData(
              createHistoryRecordData(), historyRecordReference);
          _model.updateChatDataAtIndex(
            functions.setLastIndex(_model.chatData.toList(), 1),
            (_) => ChatModelStruct(
              id: ChoicesModelStruct.maybeFromMap(
                      (_model.initResponse?.jsonBody ?? ''))
                  ?.message
                  ?.content,
              created: ChoicesModelStruct.maybeFromMap(
                      (_model.initResponse?.jsonBody ?? ''))
                  ?.message
                  ?.toMap(),
              question: widget!.question,
              answer: ChoicesModelStruct.maybeFromMap(
                      (_model.initResponse?.jsonBody ?? ''))
                  ?.message
                  ?.hasContent()
                  ?.toString(),
            ),
          );

          await HistoryItemsRecord.createDoc(
            _model.initHistoryData!.reference,
            id: widget!.collectionId!.toString(),
          ).set({
            ...createHistoryItemsRecordData(
              historyId: widget!.collectionId,
            ),
            ...mapToFirestore(
              {
                'data': getChatModelListFirestoreData(
                  _model.chatData,
                ),
              },
            ),
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Something went wrong!',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          _model.isLoading = false;
          _model.removeAtIndexFromChatData(
              functions.setLastIndex(_model.chatData.toList(), 1));
          safeSetState(() {});
        }

        _model.isLoading = false;
        safeSetState(() {});
      } else {
        _model.chatData = widget!.thread!.data.toList().cast<ChatModelStruct>();
        safeSetState(() {});
      }
    });

    _model.promptTextController ??= TextEditingController();
    _model.promptFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              if (Theme.of(context).brightness == Brightness.dark)
                wrapWithModel(
                  model: _model.pageBgModel,
                  updateCallback: () => safeSetState(() {}),
                  child: PageBgWidget(),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 52.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            Text(
                              'Thread',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final chatItems = _model.chatData.toList();
                                if (chatItems.isEmpty) {
                                  return EmptyDataWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: chatItems.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 20.0),
                                  itemBuilder: (context, chatItemsIndex) {
                                    final chatItemsItem =
                                        chatItems[chatItemsIndex];
                                    return wrapWithModel(
                                      model: _model.chatItemViewModels.getModel(
                                        widget!.collectionId!.toString(),
                                        chatItemsIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: ChatItemViewWidget(
                                        key: Key(
                                          'Keycvx_${widget!.collectionId!.toString()}',
                                        ),
                                        chat: ChatModelStruct(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          if (!_model.isLoading)
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextFormField(
                                        controller: _model.promptTextController,
                                        focusNode: _model.promptFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.promptTextController',
                                          Duration(milliseconds: 1),
                                          () async {
                                            _model.hasValue =
                                                functions.checkValue(_model
                                                    .promptTextController.text);
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText: 'Ask anything...',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 20.0, 0.0, 20.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        maxLines: 10,
                                        minLines: 1,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .promptTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      if (_model.hasValue)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      functions.getVerticalSize(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .height,
                                                          8.0),
                                                      0.0,
                                                    ),
                                                    8.0,
                                                    8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (functions.checkValue(_model
                                                    .promptTextController
                                                    .text)) {
                                                  _model.isLoading = true;
                                                  _model.addToChatData(
                                                      ChatModelStruct(
                                                    question: _model
                                                        .promptTextController
                                                        .text
                                                        .trim(),
                                                  ));
                                                  safeSetState(() {});
                                                  _model.response =
                                                      await EmilioLLMCall.call(
                                                    apiToken:
                                                        valueOrDefault<String>(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.apiKey,
                                                          ''),
                                                      '02ca6696345d914c6941d7007b762c2b3ef0e07a4a58188e6ecb09d854c44f5c',
                                                    ),
                                                    content: (String var1) {
                                                      return var1
                                                          .trim()
                                                          .replaceAll(
                                                              '"', '\\"')
                                                          .replaceAll(
                                                              "\n", " ");
                                                    }(_model
                                                        .promptTextController
                                                        .text),
                                                  );

                                                  if ((_model.response
                                                          ?.succeeded ??
                                                      true)) {
                                                    var historyRecordReference =
                                                        HistoryRecord.collection
                                                            .doc(
                                                                currentUserUid);
                                                    await historyRecordReference
                                                        .set(
                                                            createHistoryRecordData());
                                                    _model.historyData = HistoryRecord
                                                        .getDocumentFromData(
                                                            createHistoryRecordData(),
                                                            historyRecordReference);
                                                    _model
                                                        .updateChatDataAtIndex(
                                                      functions.setLastIndex(
                                                          _model.chatData
                                                              .toList(),
                                                          1),
                                                      (_) => ChatModelStruct(
                                                        id: ChoicesModelStruct
                                                                .maybeFromMap((_model
                                                                        .response
                                                                        ?.jsonBody ??
                                                                    ''))
                                                            ?.message
                                                            ?.hasContent()
                                                            ?.toString(),
                                                        created: (_model
                                                                .response
                                                                ?.jsonBody ??
                                                            ''),
                                                        question: _model
                                                            .promptTextController
                                                            .text
                                                            .trim(),
                                                        answer: ChoicesModelStruct
                                                                .maybeFromMap((_model
                                                                        .response
                                                                        ?.jsonBody ??
                                                                    ''))
                                                            ?.message
                                                            ?.content,
                                                      ),
                                                    );

                                                    await HistoryItemsRecord
                                                        .createDoc(
                                                      _model.historyData!
                                                          .reference,
                                                      id: widget!.collectionId!
                                                          .toString(),
                                                    ).set({
                                                      ...createHistoryItemsRecordData(
                                                        historyId: widget!
                                                            .collectionId,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'data':
                                                              getChatModelListFirestoreData(
                                                            _model.chatData,
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                    safeSetState(() {
                                                      _model
                                                          .promptTextController
                                                          ?.clear();
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Something went wrong!${(_model.response?.statusCode ?? 200).toString()}',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    _model.isLoading = false;
                                                    _model.removeAtIndexFromChatData(
                                                        functions.setLastIndex(
                                                            _model.chatData
                                                                .toList(),
                                                            1));
                                                    safeSetState(() {});
                                                  }

                                                  _model.isLoading = false;
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.send_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
