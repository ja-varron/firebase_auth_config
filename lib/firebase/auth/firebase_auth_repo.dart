import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_config/features/auth/domain/app_user.dart';
import 'package:firebase_auth_config/features/auth/repo/auth_repo.dart';

class FirebaseAuthRepo  implements AuthRepo {
  final _auth = FirebaseAuth.instance;

  final _userCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      User? currentUser = userCredential.user;

      if(currentUser != null && currentUser.emailVerified) {
        final userDoc = await _userCollection.doc(currentUser.uid).get(); 

        final userData = userDoc.data();

        if(userData != null) {
          AppUser user = AppUser(
            userId: currentUser.uid, 
            email: email, 
            name: userData['name']
          );

          return user;
        }
      } 
      return null;
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signUpWithEmailPassword(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User? registeredUser = userCredential.user;

      await registeredUser?.sendEmailVerification();

      AppUser user = AppUser(
        userId: registeredUser!.uid, 
        email: email, 
        name: name
      );

      await _userCollection.doc(user.userId).set(user.toJson());
    } catch(e) {
      throw Exception(e);
    }
  }
}