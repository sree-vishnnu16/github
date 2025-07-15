import 'package:github/feature/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<LoginEntity> signInWithGithub();

  Future<bool> signOut();
}
