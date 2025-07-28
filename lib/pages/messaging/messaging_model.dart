import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'messaging_widget.dart' show MessagingWidget;
import 'package:flutter/material.dart';

class MessagingModel extends FlutterFlowModel<MessagingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ChatsRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ChatsRecord>? chats;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
