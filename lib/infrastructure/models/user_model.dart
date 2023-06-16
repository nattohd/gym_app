import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String email;
  String phone;
  String displayName;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.displayName,
  });

  factory UserModel.fromFirestore(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email!,
      phone: user.phoneNumber ?? 'No definido',
      displayName: user.displayName ?? 'No definido',
    );
  }
}
