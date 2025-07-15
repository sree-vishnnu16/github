import 'package:github/feature/github/domain/entities/branch.dart';
import 'package:github/feature/github/domain/entities/commit.dart';
import 'package:github/feature/github/domain/entities/github.dart';
import 'package:github/feature/github/domain/repositories/github_repository.dart';

class GetUserRepositoriesUseCase {
  final GitHubRepository repository;

  GetUserRepositoriesUseCase(this.repository);

  Future<List<GitHubRepositoryEntity>> getAllRepos() {
    return repository.getUserRepositories();
  }

  Future<List<BranchEntity>> getBranches(String owner, String repo) {
    return repository.getBranches(owner: owner, repo: repo);
  }

  Future<List<CommitEntity>> getCommits(String owner, String repo, String branch) {
    return repository.getCommits(owner: owner, repo: repo, branch: branch);
  }
}
