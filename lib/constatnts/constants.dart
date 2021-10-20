import 'package:apptestfh/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ConstantCall {
  static final AuthController auth = AuthController.to;
  static final Future<FirebaseApp> firebaseApp = Firebase.initializeApp();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}
