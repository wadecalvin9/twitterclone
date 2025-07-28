// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MessageModelStruct extends FFFirebaseStruct {
  MessageModelStruct({
    String? message,
    DocumentReference? seenBy,
    DateTime? sendedAt,
    DocumentReference? sendedBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _seenBy = seenBy,
        _sendedAt = sendedAt,
        _sendedBy = sendedBy,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "seenBy" field.
  DocumentReference? _seenBy;
  DocumentReference? get seenBy => _seenBy;
  set seenBy(DocumentReference? val) => _seenBy = val;

  bool hasSeenBy() => _seenBy != null;

  // "sendedAt" field.
  DateTime? _sendedAt;
  DateTime? get sendedAt => _sendedAt;
  set sendedAt(DateTime? val) => _sendedAt = val;

  bool hasSendedAt() => _sendedAt != null;

  // "sendedBy" field.
  DocumentReference? _sendedBy;
  DocumentReference? get sendedBy => _sendedBy;
  set sendedBy(DocumentReference? val) => _sendedBy = val;

  bool hasSendedBy() => _sendedBy != null;

  static MessageModelStruct fromMap(Map<String, dynamic> data) =>
      MessageModelStruct(
        message: data['message'] as String?,
        seenBy: data['seenBy'] as DocumentReference?,
        sendedAt: data['sendedAt'] as DateTime?,
        sendedBy: data['sendedBy'] as DocumentReference?,
      );

  static MessageModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MessageModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'seenBy': _seenBy,
        'sendedAt': _sendedAt,
        'sendedBy': _sendedBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'seenBy': serializeParam(
          _seenBy,
          ParamType.DocumentReference,
        ),
        'sendedAt': serializeParam(
          _sendedAt,
          ParamType.DateTime,
        ),
        'sendedBy': serializeParam(
          _sendedBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static MessageModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageModelStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        seenBy: deserializeParam(
          data['seenBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        sendedAt: deserializeParam(
          data['sendedAt'],
          ParamType.DateTime,
          false,
        ),
        sendedBy: deserializeParam(
          data['sendedBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
      );

  @override
  String toString() => 'MessageModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageModelStruct &&
        message == other.message &&
        seenBy == other.seenBy &&
        sendedAt == other.sendedAt &&
        sendedBy == other.sendedBy;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([message, seenBy, sendedAt, sendedBy]);
}

MessageModelStruct createMessageModelStruct({
  String? message,
  DocumentReference? seenBy,
  DateTime? sendedAt,
  DocumentReference? sendedBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageModelStruct(
      message: message,
      seenBy: seenBy,
      sendedAt: sendedAt,
      sendedBy: sendedBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageModelStruct? updateMessageModelStruct(
  MessageModelStruct? messageModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messageModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageModelStructData(
  Map<String, dynamic> firestoreData,
  MessageModelStruct? messageModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messageModel == null) {
    return;
  }
  if (messageModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messageModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageModelData =
      getMessageModelFirestoreData(messageModel, forFieldValue);
  final nestedData =
      messageModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messageModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageModelFirestoreData(
  MessageModelStruct? messageModel, [
  bool forFieldValue = false,
]) {
  if (messageModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messageModel.toMap());

  // Add any Firestore field values
  messageModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageModelListFirestoreData(
  List<MessageModelStruct>? messageModels,
) =>
    messageModels?.map((e) => getMessageModelFirestoreData(e, true)).toList() ??
    [];
