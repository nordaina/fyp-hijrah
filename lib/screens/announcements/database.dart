import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('announcements');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String title,
    required String description,
  }) async {
    
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await _mainCollection.add(data) //documentReferencer
        //.set(data)
        .whenComplete(() => print("Announcement record added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await _mainCollection.doc(docId)//documentReferencer
        .update(data)
        .whenComplete(() => print("Announcement record updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    // CollectionReference notesItemCollection =
    //     _mainCollection.doc(userUid).collection('items');

    return _mainCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    //DocumentReference documentReferencer =
        // _mainCollection.doc(userUid).collection('items').doc(docId);

    await _mainCollection.doc(docId)//documentReferencer
        .delete()
        .whenComplete(() => print('Announcement record deleted from the database'))
        .catchError((e) => print(e));
  }
}
