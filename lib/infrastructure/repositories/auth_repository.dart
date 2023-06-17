import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/main.dart';

class AuthRepository {
  final FirebaseAuth auth =
      FirebaseAuth.instanceFor(app: firebaseService.firebaseApp);

  MicrosoftAuthProvider microsoftSignIn = MicrosoftAuthProvider();

  Future<UserCredential?> getDataFromRedirect() async {
    try {
      final response = await auth.getRedirectResult();
      return response;
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      print('Ocurrio un error en "auth_repository get data from redirect"');
      return null;
    }
  }

  Future<void> loginWithMicrosoftProvider() async {
    try {
      await auth.signInWithRedirect(MicrosoftAuthProvider());
    } on FirebaseAuthException catch (e) {
      // print(e.message);
    }
  }

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<void> signOutUser() async {
    await auth.signOut();
  }
}
