import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/page_bg/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_screen_model.dart';
export 'register_screen_model.dart';

class RegisterScreenWidget extends StatefulWidget {
  const RegisterScreenWidget({super.key});

  @override
  State<RegisterScreenWidget> createState() => _RegisterScreenWidgetState();
}

class _RegisterScreenWidgetState extends State<RegisterScreenWidget> {
  late RegisterScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterScreenModel());

    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (Theme.of(context).brightness == Brightness.dark)
                wrapWithModel(
                  model: _model.pageBgModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const PageBgWidget(),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 0.0, 32.0),
                        child: Text(
                          'VEP Portal',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displaySmallFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          'Register new user here!',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.usernameTextController,
                                  focusNode: _model.usernameFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Username',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .usernameTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.emailAddressTextController,
                                  focusNode: _model.emailAddressFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Email',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .emailAddressTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.passwordTextController,
                                  focusNode: _model.passwordFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .passwordTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.confirmPasswordTextController,
                                  focusNode: _model.confirmPasswordFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Confirm Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .confirmPasswordTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    if (_model.passwordTextController.text !=
                                        _model.confirmPasswordTextController
                                            .text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Passwords don\'t match!',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    final user = await authManager
                                        .createAccountWithEmail(
                                      context,
                                      _model.emailAddressTextController.text,
                                      _model.passwordTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await UsersRecord.collection
                                        .doc(user.uid)
                                        .update(createUsersRecordData(
                                          displayName: valueOrDefault<String>(
                                            _model.usernameTextController.text,
                                            'New User',
                                          ),
                                          photoUrl:
                                              'data:image/jpeg;base64,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',
                                        ));

                                    context.pushNamedAuth(
                                        'ChatScreen', context.mounted);
                                  },
                                  text: 'Register',
                                  options: FFButtonOptions(
                                    width: 172.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 64.0,
                                        child: Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Or',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 64.0,
                                        child: Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(width: 16.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 48.0,
                                    borderWidth: 2.0,
                                    buttonSize: 48.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: FaIcon(
                                      FontAwesomeIcons.google,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager
                                          .signInWithGoogle(context);
                                      if (user == null) {
                                        return;
                                      }

                                      context.pushNamedAuth(
                                          'ChatScreen', context.mounted);
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 48.0,
                                    borderWidth: 2.0,
                                    buttonSize: 48.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: FaIcon(
                                      FontAwesomeIcons.apple,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager
                                          .signInWithApple(context);
                                      if (user == null) {
                                        return;
                                      }

                                      context.pushNamedAuth(
                                          'ChatScreen', context.mounted);
                                    },
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: const BoxDecoration(),
                      ),
                      Text(
                        'Already have an account?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Text(
                          'Login Here',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 12.0)),
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
