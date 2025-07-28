import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "USerRf" field.
  DocumentReference? _uSerRf;
  DocumentReference? get uSerRf => _uSerRf;
  bool hasUSerRf() => _uSerRf != null;

  // "Postrf" field.
  DocumentReference? _postrf;
  DocumentReference? get postrf => _postrf;
  bool hasPostrf() => _postrf != null;

  // "Posttime" field.
  DateTime? _posttime;
  DateTime? get posttime => _posttime;
  bool hasPosttime() => _posttime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _uSerRf = snapshotData['USerRf'] as DocumentReference?;
    _postrf = snapshotData['Postrf'] as DocumentReference?;
    _posttime = snapshotData['Posttime'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? comment,
  DocumentReference? uSerRf,
  DocumentReference? postrf,
  DateTime? posttime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'USerRf': uSerRf,
      'Postrf': postrf,
      'Posttime': posttime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.comment == e2?.comment &&
        e1?.uSerRf == e2?.uSerRf &&
        e1?.postrf == e2?.postrf &&
        e1?.posttime == e2?.posttime &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.comment, e?.uSerRf, e?.postrf, e?.posttime, e?.likes]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
