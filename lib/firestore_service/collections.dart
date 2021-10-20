import 'package:apptestfh/constatnts/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionFireStore {
  static final CollectionReference collectionReferenceUsers =
      ConstantCall.firebaseFirestore.collection("users");
}
