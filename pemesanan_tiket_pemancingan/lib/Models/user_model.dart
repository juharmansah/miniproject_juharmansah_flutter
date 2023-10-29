import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String id;
  final String username;
  final String password;

UserModel (this.id, this.username, this.password );

factory UserModel.fromSnapshot(
  DocumentSnapshot<Map<String, dynamic>>documentSnapshot
){
  return UserModel(documentSnapshot.id, documentSnapshot['username'], documentSnapshot['password']);
}
}