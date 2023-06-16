import 'package:flutter/foundation.dart';
import 'package:gym_app/infrastructure/models/user_model.dart';
import 'package:gym_app/infrastructure/repositories/auth_repository.dart';

enum AuthStatus {
  authenticated,
  authenticating,
  notAuthenticated,
}

class UserProvider extends ChangeNotifier {
  UserModel? user;
  ValueNotifier<AuthStatus> status =
      ValueNotifier<AuthStatus>(AuthStatus.notAuthenticated);
  final AuthRepository authRepository = AuthRepository();

  static final UserProvider _singleton = UserProvider._internal();
  factory UserProvider() {
    return _singleton;
  }

  List<String> errors = [];

  UserProvider._internal();

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    status.value = AuthStatus.authenticating;
    notifyListeners();

    final response =
        await authRepository.loginWithEmailAndPassword(email, password);
    if (response != null && response.user != null) {
      // Actualizas el estado cuando el usuario inicia sesión correctamente
      user = UserModel.fromFirestore(response.user!);
      status.value = AuthStatus.authenticated;
      errors.clear();
    } else {
      // En caso de error en el inicio de sesión
      if (!errors.contains('Credenciales incorrectas')) {
        errors.add('Credenciales incorrectas');
      }
      status.value = AuthStatus.notAuthenticated;
    }
    notifyListeners();
  }

  Future<void> signOutUser() async {
    await authRepository.signOutUser();
    status.value = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
