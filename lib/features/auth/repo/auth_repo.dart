import 'package:firebase_auth_config/features/auth/domain/app_user.dart';

abstract class AuthRepo {
  Future<void> signUpWithEmailPassword(String email, String password, String name);
  Future<AppUser?> loginWithEmailPassword(String email, String password);
}