import 'package:github/feature/github/domain/entities/github.dart';
import 'package:github/feature/github/domain/repositories/github_repository.dart';

class GetUserRepositoriesUseCase {
  final GitHubRepository repository;

  GetUserRepositoriesUseCase(this.repository);

  Future<List<GitHubRepositoryEntity>> getAllRepos() {
    return repository.getUserRepositories();
  }
}
