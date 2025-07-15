import 'package:github/feature/github/domain/entities/github.dart';
import 'package:github/feature/github/domain/entities/owner.dart';
import 'package:github/feature/github/domain/repositories/github_repository.dart';
import 'package:github/feature/github/infrastructure/data/remote/github_remote_service.dart';

class GitHubRemoteRepositoryImpl implements GitHubRepository {
  final GitHubRemoteService _service = GitHubRemoteService();

  @override
  Future<List<GitHubRepositoryEntity>> getUserRepositories() async {
    final models = await _service.fetchRepositories();
    if (models.isEmpty) {
      return [];
    }
    List<GitHubRepositoryEntity> repositories = [];
    for (var model in models) {
      repositories.add(GitHubRepositoryEntity(
        id: model.id ?? 0,
        name: model.name ?? '',
        visibility: model.visibility ?? '',
        default_branch: model.default_branch ?? '',
        description: model.description ?? '',
        owner: OwnerEntity(
          login: model.owner?.login ?? '',
          id: model.owner?.id ?? 0,
          node_id: model.owner?.node_id ?? '',
          avatar_url: model.owner?.avatar_url ?? '',
          gravatar_id: model.owner?.gravatar_id ?? '',
          url: model.owner?.url ?? '',
          html_url: model.owner?.html_url ?? '',
          repos_url: model.owner?.repos_url ?? '',
          events_url: model.owner?.events_url ?? '',
        ),
      ));
    }
    return repositories;
  }
}
