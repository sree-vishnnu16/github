import 'package:github/feature/github/domain/entities/branch.dart';
import 'package:github/feature/github/domain/entities/commit.dart';
import 'package:github/feature/github/domain/entities/github.dart';

abstract class GitHubRepository {
  Future<List<GitHubRepositoryEntity>> getUserRepositories();

  Future<List<BranchEntity>> getBranches({
    required String owner,
    required String repo,
  });

  Future<List<CommitEntity>> getCommits({
    required String owner,
    required String repo,
    required String branch,
  });
}
