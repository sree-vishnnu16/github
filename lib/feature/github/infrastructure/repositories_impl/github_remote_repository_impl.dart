import 'package:github/feature/github/domain/entities/branch.dart';
import 'package:github/feature/github/domain/entities/commit.dart';
import 'package:github/feature/github/domain/entities/github.dart';
import 'package:github/feature/github/domain/entities/head_commit.dart';
import 'package:github/feature/github/domain/entities/owner.dart';
import 'package:github/feature/github/domain/repositories/github_repository.dart';
import 'package:github/feature/github/infrastructure/data/remote/github_remote_service.dart';
import 'package:github/feature/github/infrastructure/models/branch_model.dart';
import 'package:github/feature/github/infrastructure/models/commit_model.dart';

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

  @override
  Future<List<BranchEntity>> getBranches({
    required String owner,
    required String repo,
  }) async {
    final branches = await _service.fetchBranches(owner, repo);
    final List<BranchEntity> branchEntities = [];

    for (final branch in branches) {
      if (branch.name != null && branch.headCommit != null) {
        branchEntities.add(
          BranchEntity(
            name: branch.name!,
            headCommit: HeadCommitEntity(
              sha: branch.headCommit!.sha ?? '',
              url: branch.headCommit!.url ?? '',
            ),
            commits: List<CommitEntity>.empty(growable: true),
          ),
        );
      } else {
        print(
            'Warning: Skipping branch with null name or headCommit: ${branch.name}');
      }
    }

    return branchEntities;
  }

  Future<List<CommitEntity>> getCommits({
    required String owner,
    required String repo,
    required String branch,
  }) async {
    final commits = await _service.fetchCommits(owner, repo, branch);
    List<CommitEntity> commitEntities = [];
    for (final commit in commits) {
      commitEntities.add(
        CommitEntity(
          message: commit.message ?? '',
          authorName: commit.authorName ?? '',
          commitDate: commit.date ?? '',
        ),
      );
    }
    return commitEntities;
  }
}
