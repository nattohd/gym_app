import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/main.dart';

class AuthRepository {
  final FirebaseAuth auth =
      FirebaseAuth.instanceFor(app: firebaseService.firebaseApp);

  MicrosoftAuthProvider microsoftSignIn = MicrosoftAuthProvider();

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
