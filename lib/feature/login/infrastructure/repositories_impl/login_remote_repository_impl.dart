import 'package:firebase_auth/firebase_auth.dart';
import 'package:github/feature/login/domain/entities/login.dart';
import 'package:github/feature/login/domain/repositories/login_repository.dart';
import 'package:github/feature/login/infrastructure/data/local/token_storage.dart';
import 'package:github/feature/login/infrastructure/data/remote/login_remote_service.dart';

class LoginRemoteRepositoryImpl implements LoginRepository {
  @override
  Future<LoginEntity> signInWithGithub() async {
    final userCredential = await LoginRemoteService().signInWithGithub();
    final user = userCredential!.user;
    final oauthCredential = userCredential.credential as AuthCredential;
    final token = oauthCredential.accessToken;

    if (token != null) {
      await TokenStorage().saveToken(token);
    }

    return LoginEntity(
      uid: user!.uid,
      email: user.email,
      token: token,
    );
  }
}
