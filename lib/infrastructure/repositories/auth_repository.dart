import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/main.dart';

class AuthRepository {
  final FirebaseAuth auth =
      FirebaseAuth.instanceFor(app: firebaseService.firebaseApp);
  OAuthProvider provider = OAuthProvider('microsoft.com');

  Future<UserCredential?> loginWithMicrosoft() async {
    try {
      // provider.setScopes(['mail.read', 'calendars.read']);
      provider.setCustomParameters({
        'prompt': 'consent',
        'login_hint': 'usuario@usm.cl',
      });
      final response = await auth.signInWithProvider(provider);
      return response;
    } on FirebaseAuthException catch (err) {
      print('ERROR EN "loginWithMicrosoft": $err');
      return null;
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
