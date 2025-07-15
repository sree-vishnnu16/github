import 'package:github/feature/github/domain/entities/github.dart';
import 'package:github/feature/github/domain/repositories/github_repository.dart';
import 'package:github/feature/github/infrastructure/data/remote/github_remote_service.dart';

class GitHubRemoteRepositoryImpl implements GitHubRepository {

  final GitHubRemoteService _service = GitHubRemoteService();
  @override
  Future<List<GitHubRepositoryEntity>> getUserRepositories() async {
    final models = await _service.fetchRepositories();
    if(models.isEmpty) {
      return [];
    }
    List<GitHubRepositoryEntity> repositories = [];
    for (var model in models) {
      repositories.add(GitHubRepositoryEntity(
        name: model.name ?? '',
        visibility: model.visibility ?? '',
        default_branch: model.default_branch ?? '',
      ));
    }
    return repositories;
  }
}
