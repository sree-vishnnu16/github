import 'package:github/feature/login/application/use_cases/login_use_cases.dart';
import 'package:github/feature/login/infrastructure/repositories_impl/login_remote_repository_impl.dart';
class GithubUseCasesInjection {
  late final SignInWithGithubUseCase signInWithGithubUseCase;

  // private constructor for singleton
  GithubUseCasesInjection._();

  static final GithubUseCasesInjection _instance = GithubUseCasesInjection._();

  factory GithubUseCasesInjection() => _instance;

  void init() async {
    signInWithGithubUseCase = SignInWithGithubUseCase(LoginRemoteRepositoryImpl());
  }
}
