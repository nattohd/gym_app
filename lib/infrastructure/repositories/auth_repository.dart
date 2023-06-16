import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/main.dart';

class AuthRepository {
  final FirebaseAuth auth =
      FirebaseAuth.instanceFor(app: firebaseService.firebaseApp);

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOutUser() async {
    await auth.signOut();
  }
}
