import 'package:cloud_firestore/cloud_firestore.dart';
import '/datamodels/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('publicusers');

  Future createUser(PublicUser user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return PublicUser.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}