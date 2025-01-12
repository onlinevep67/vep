import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'chat_item_view_model.dart';
export 'chat_item_view_model.dart';

class ChatItemViewWidget extends StatefulWidget {
  const ChatItemViewWidget({
    super.key,
    required this.chat,
  });

  final ChatModelStruct? chat;

  @override
  State<ChatItemViewWidget> createState() => _ChatItemViewWidgetState();
}

class _ChatItemViewWidgetState extends State<ChatItemViewWidget>
    with TickerProviderStateMixin {
  late ChatItemViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatItemViewModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0xFF7E8999),
            angle: 0.785,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                functions.getVerticalSize(
                    MediaQuery.sizeOf(context).height, 16.0),
                0.0,
              ),
              0.0,
              valueOrDefault<double>(
                functions.getVerticalSize(
                    MediaQuery.sizeOf(context).height, 16.0),
                0.0,
              ),
              valueOrDefault<double>(
                functions.getVerticalSize(
                    MediaQuery.sizeOf(context).height, 20.0),
                0.0,
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectionArea(
                  child: Text(
                widget.chat!.question,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyLargeFamily),
                    ),
              )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      functions.getVerticalSize(
                          MediaQuery.sizeOf(context).height, 20.0),
                      0.0,
                    ),
                    0.0,
                    valueOrDefault<double>(
                      functions.getVerticalSize(
                          MediaQuery.sizeOf(context).height, 10.0),
                      0.0,
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.alignLeft,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 15.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Answer',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  if (functions.checkValue(widget.chat?.answer)) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        custom_widgets.AnswerView(
                          width: double.infinity,
                          height: 20.0,
                          text: widget.chat!.answer,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 20.0),
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 10.0),
                                0.0,
                              )),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (false)
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Share.share(
                                        '${widget.chat?.question}${widget.chat?.answer}',
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: widget.chat!.answer));
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.copy,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                            ].divide(const SizedBox(width: 15.0)),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: functions.getVerticalSize(
                                MediaQuery.sizeOf(context).height, 20.0),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: Container(
                              width: 200.0,
                              height: functions.getVerticalSize(
                                  MediaQuery.sizeOf(context).height, 20.0),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: functions.getVerticalSize(
                                MediaQuery.sizeOf(context).height, 20.0),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ],
    );
  }
}
