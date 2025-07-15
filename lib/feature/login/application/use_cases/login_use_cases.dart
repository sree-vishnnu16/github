import 'package:github/feature/login/domain/entities/login.dart';
import 'package:github/feature/login/domain/repositories/login_repository.dart';

class SignInWithGithubUseCase {
  final LoginRepository repository;

  SignInWithGithubUseCase(this.repository);

  Future<LoginEntity> execute() {
    return repository.signInWithGithub();
  }
}
