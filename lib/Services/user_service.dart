// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:addictify/Model/l_user.dart';

class UserService{

  final String uid;
  final CollectionReference usersCollection;

  UserService(this.uid):
        usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUser(LUser user) async{
    return await usersCollection.doc(uid).set(
        {
          'uid' : user.uid,
          'name' : user.name,
          'email' : user.email,
        }
    );
  }








}