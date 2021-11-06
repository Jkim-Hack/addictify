import 'package:addictify/Services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:addictify/Model/l_user.dart';

class AuthService {

  static final FirebaseAuth _authentication = FirebaseAuth.instance;

  LUser userValueFromFirebase(User? user) {
    return LUser(uid: user!.uid, name: user.displayName, email: user.email);
  }

  Future<LUser> registerWithEmailAndPassword(String email, String password) async
  {
    try {
      UserCredential resultInfo = await _authentication
          .createUserWithEmailAndPassword(email: email, password: password);

      User? signedInUser = resultInfo.user;

      await UserService(signedInUser!.uid).updateUser(LUser(uid:signedInUser.uid,name:"",email:email));
      //await UserRecordService(signedInUser.uid).updateUserRecord(new UserRecord(coinCount: 0, numChallengeCompleted:0,completedChallengeID: new HashMap()));
      return userValueFromFirebase(signedInUser);
    }
    catch(error)
    {
      print("Error: " + error.toString());
      return LUser(uid: "", name: "", email: "");
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async
  {
    UserCredential resultInfo = await _authentication.signInWithEmailAndPassword(email: email, password: password);
    User? user = resultInfo.user;
    return user;
  }
}
