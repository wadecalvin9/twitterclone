import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'users_screen_widget.dart' show UsersScreenWidget;
import 'package:flutter/material.dart';

class UsersScreenModel extends FlutterFlowModel<UsersScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UserRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ChatsRecord>? chats;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChat;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ChatsRecord>? users1;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChats1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
