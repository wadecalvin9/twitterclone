import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "messagesList" field.
  List<MessageModelStruct>? _messagesList;
  List<MessageModelStruct> get messagesList => _messagesList ?? const [];
  bool hasMessagesList() => _messagesList != null;

  // "user" field.
  List<DocumentReference>? _user;
  List<DocumentReference> get user => _user ?? const [];
  bool hasUser() => _user != null;

  // "typing" field.
  List<DocumentReference>? _typing;
  List<DocumentReference> get typing => _typing ?? const [];
  bool hasTyping() => _typing != null;

  void _initializeFields() {
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
    _messagesList = getStructList(
      snapshotData['messagesList'],
      MessageModelStruct.fromMap,
    );
    _user = getDataList(snapshotData['user']);
    _typing = getDataList(snapshotData['typing']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        listEquality.equals(e1?.messagesList, e2?.messagesList) &&
        listEquality.equals(e1?.user, e2?.user) &&
        listEquality.equals(e1?.typing, e2?.typing);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.messagesList,
        e?.user,
        e?.typing
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
