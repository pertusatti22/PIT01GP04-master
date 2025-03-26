import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';
import 'base_database_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => UserModel.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(UserModel user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then(
          (value) => log('User Document Updated.'),
        );
  }

  @override
  Future<void> createUser(UserModel user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }
}
