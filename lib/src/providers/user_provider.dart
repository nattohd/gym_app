import 'package:flutter/foundation.dart';
import 'package:gym_app/infrastructure/models/user_model.dart';
import 'package:gym_app/infrastructure/repositories/auth_repository.dart';

enum AuthStatus {
  authenticated,
  authenticating,
  notAuthenticated,
}

AuthStatus globalAuthStatus = AuthStatus.notAuthenticated;

class UserProvider extends ChangeNotifier {
  UserModel? user;
  AuthStatus status = AuthStatus.notAuthenticated;
  final AuthRepository authRepository = AuthRepository();

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    status = AuthStatus.authenticating;
    notifyListeners();

    final response =
        await authRepository.loginWithEmailAndPassword(email, password);

    if (response != null && response.user != null) {
      // Actualizas el estado cuando el usuario inicia sesión correctamente
      user = UserModel.fromFirestore(response.user!);
      status = AuthStatus.authenticated;
    } else {
      // En caso de error en el inicio de sesión
      status = AuthStatus.notAuthenticated;
    }
    notifyListeners();
    globalAuthStatus = status;
  }

  Future<void> signOutUser() async {
    await authRepository.signOutUser();
    status = AuthStatus.notAuthenticated;
    notifyListeners();
    globalAuthStatus = status;
  }
}
