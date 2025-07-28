import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'users_screen_model.dart';
export 'users_screen_model.dart';

class UsersScreenWidget extends StatefulWidget {
  const UsersScreenWidget({super.key});

  static String routeName = 'users_screen';
  static String routePath = '/usersScreen';

  @override
  State<UsersScreenWidget> createState() => _UsersScreenWidgetState();
}

class _UsersScreenWidgetState extends State<UsersScreenWidget> {
  late UsersScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).alternate,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'iyr0w54v' /* Users */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () async {
                                  await queryUserRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.displayName,
                                                  record.email
                                                ]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.textController.text)
                                            .map((r) => r.object)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults = [])
                                      .whenComplete(() => safeSetState(() {}));

                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '3kpy6ivi' /* Search */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                safeSetState(() {
                                  _model.textController?.clear();
                                });
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'twzayavs' /* Active Now */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: FutureBuilder<List<UserRecord>>(
                            future: queryUserRecordOnce(
                              queryBuilder: (userRecord) => userRecord.where(
                                'isOnline',
                                isEqualTo: true,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UserRecord> listViewUserRecordList = snapshot
                                  .data!
                                  .where((u) => u.uid != currentUserUid)
                                  .toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewUserRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(width: 10.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewUserRecord =
                                      listViewUserRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.chats = await queryChatsRecordOnce(
                                        queryBuilder: (chatsRecord) =>
                                            chatsRecord.where(
                                          'user',
                                          arrayContains: currentUserReference,
                                        ),
                                      );
                                      if (_model.chats!
                                              .where((e) =>
                                                  functions.checkUsers(
                                                      currentUserReference!,
                                                      listViewUserRecord
                                                          .reference,
                                                      e.user.toList()))
                                              .toList()
                                              .length >
                                          0) {
                                        context.pushNamed(
                                          ChatWidget.routeName,
                                          queryParameters: {
                                            'chatRef': serializeParam(
                                              _model.chats
                                                  ?.where((e) =>
                                                      functions.checkUsers(
                                                          currentUserReference!,
                                                          listViewUserRecord
                                                              .reference,
                                                          e.user.toList()))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        var chatsRecordReference =
                                            ChatsRecord.collection.doc();
                                        await chatsRecordReference.set({
                                          ...mapToFirestore(
                                            {
                                              'user': functions.usersList(
                                                  listViewUserRecord.reference,
                                                  currentUserReference!),
                                            },
                                          ),
                                        });
                                        _model.newChat =
                                            ChatsRecord.getDocumentFromData({
                                          ...mapToFirestore(
                                            {
                                              'user': functions.usersList(
                                                  listViewUserRecord.reference,
                                                  currentUserReference!),
                                            },
                                          ),
                                        }, chatsRecordReference);

                                        context.pushNamed(
                                          ChatWidget.routeName,
                                          queryParameters: {
                                            'chatRef': serializeParam(
                                              _model.newChat?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 41.0,
                                              height: 41.0,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      listViewUserRecord
                                                          .photoUrl,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.91, 0.78),
                                                    child: Container(
                                                      width: 8.0,
                                                      height: 8.0,
                                                      decoration: BoxDecoration(
                                                        color: listViewUserRecord
                                                                    .isOnline ==
                                                                false
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText
                                                            : Color(0xFF17E339),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              listViewUserRecord.displayName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4ui83cpp' /* Recent Chats */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
                    child: FutureBuilder<List<ChatsRecord>>(
                      future: queryChatsRecordOnce(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .orderBy('lastMessageTime', descending: true),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ChatsRecord> columnChatsRecordList =
                            snapshot.data!;
                        if (columnChatsRecordList.isEmpty) {
                          return Center(
                            child: EmptyMessageWidget(
                              title: 'No Users',
                              message: 'No friends for start chat',
                            ),
                          );
                        }
                        final columnChatsRecord =
                            columnChatsRecordList.isNotEmpty
                                ? columnChatsRecordList.first
                                : null;

                        return Builder(
                          builder: (context) {
                            final search = _model.simpleSearchResults.toList();
                            if (search.isEmpty) {
                              return Center(
                                child: EmptyMessageWidget(
                                  title: 'No Users',
                                  message: 'No friends for start chat',
                                ),
                              );
                            }

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(search.length, (searchIndex) {
                                  final searchItem = search[searchIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.users1 =
                                          await queryChatsRecordOnce(
                                        queryBuilder: (chatsRecord) =>
                                            chatsRecord.where(
                                          'user',
                                          arrayContains: currentUserReference,
                                        ),
                                      );
                                      if (_model.users1!
                                              .where((e) =>
                                                  functions.checkUsers(
                                                      currentUserReference!,
                                                      searchItem.reference,
                                                      e.user.toList()))
                                              .toList()
                                              .length >
                                          0) {
                                        context.pushNamed(
                                          ChatWidget.routeName,
                                          queryParameters: {
                                            'chatRef': serializeParam(
                                              _model.users1
                                                  ?.where((e) =>
                                                      functions.checkUsers(
                                                          currentUserReference!,
                                                          searchItem.reference,
                                                          e.user.toList()))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        var chatsRecordReference =
                                            ChatsRecord.collection.doc();
                                        await chatsRecordReference.set({
                                          ...createChatsRecordData(
                                            lastMessage: 'Hello',
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'user': functions.usersList(
                                                  searchItem.reference,
                                                  currentUserReference!),
                                              'messagesList': [
                                                getMessageModelFirestoreData(
                                                  updateMessageModelStruct(
                                                    MessageModelStruct(
                                                      message: 'Hello',
                                                      seenBy:
                                                          currentUserReference,
                                                      sendedAt:
                                                          getCurrentTimestamp,
                                                      sendedBy:
                                                          currentUserReference,
                                                    ),
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            },
                                          ),
                                        });
                                        _model.newChats1 =
                                            ChatsRecord.getDocumentFromData({
                                          ...createChatsRecordData(
                                            lastMessage: 'Hello',
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'user': functions.usersList(
                                                  searchItem.reference,
                                                  currentUserReference!),
                                              'messagesList': [
                                                getMessageModelFirestoreData(
                                                  updateMessageModelStruct(
                                                    MessageModelStruct(
                                                      message: 'Hello',
                                                      seenBy:
                                                          currentUserReference,
                                                      sendedAt:
                                                          getCurrentTimestamp,
                                                      sendedBy:
                                                          currentUserReference,
                                                    ),
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            },
                                          ),
                                        }, chatsRecordReference);

                                        context.pushNamed(
                                          ChatWidget.routeName,
                                          queryParameters: {
                                            'chatRef': serializeParam(
                                              _model.newChats1?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    searchItem.photoUrl,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      searchItem.displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 8.0,
                                                      height: 8.0,
                                                      decoration: BoxDecoration(
                                                        color: searchItem
                                                                    .isOnline ==
                                                                false
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText
                                                            : Color(0xFF17E339),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 12.0)),
                                                ),
                                              ].divide(SizedBox(width: 12.0)),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 10.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
