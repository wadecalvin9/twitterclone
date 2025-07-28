import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_copy_widget.dart' show ChatCopyWidget;
import 'package:flutter/material.dart';

class ChatCopyModel extends FlutterFlowModel<ChatCopyWidget> {
  ///  Local state fields for this page.

  int? seen = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in chatCopy widget.
  ChatsRecord? chat;
  // Stores action output result for [Custom Action - seenMessageAction] action in chatCopy widget.
  List<MessageModelStruct>? seen1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
