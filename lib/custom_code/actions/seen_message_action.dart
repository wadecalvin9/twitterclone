// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MessageModelStruct>> seenMessageAction(
  DocumentReference user,
  List<MessageModelStruct> chat,
) async {
  for (var message in chat) {
    if (message.sendedBy != user) {
      if (message.seenBy != user) {
        message.seenBy = user;
      }
    }
  }
  return chat;
  // Add your function code here!
}
