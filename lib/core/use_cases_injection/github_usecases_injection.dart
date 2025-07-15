import 'package:github/feature/github/application/use_cases/github_use_cases.dart';
import 'package:github/feature/github/infrastructure/repositories_impl/github_remote_repository_impl.dart';
import 'package:github/feature/login/application/use_cases/login_use_cases.dart';
import 'package:github/feature/login/infrastructure/repositories_impl/login_remote_repository_impl.dart';
class GithubUseCasesInjection {
  late final SignInWithGithubUseCase signInWithGithubUseCase;
  late final GetUserRepositoriesUseCase getUserRepositoriesUseCase;

  // private constructor for singleton
  GithubUseCasesInjection._();

  static final GithubUseCasesInjection _instance = GithubUseCasesInjection._();

  factory GithubUseCasesInjection() => _instance;

  void init() async {
    signInWithGithubUseCase = SignInWithGithubUseCase(LoginRemoteRepositoryImpl());
    getUserRepositoriesUseCase = GetUserRepositoriesUseCase(GitHubRemoteRepositoryImpl());
  }
}
