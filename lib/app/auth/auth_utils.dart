import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String get currentUserEmail => currentUser?.email ?? '';

String get currentUserUid => currentUser?.uid ?? '';

String get currentUserDisplayName => currentUser?.displayName ?? '';

String get currentUserPhoto => currentUser?.photoURL ?? '';

String get currentPhoneNumber => currentUser?.phoneNumber ?? '';

DocumentReference? get currentUserReference =>
    currentUser != null ? FirebaseFirestore.instance.doc("/users/$currentUserUid") : null;

User? currentUser = FirebaseAuth.instance.currentUser;
