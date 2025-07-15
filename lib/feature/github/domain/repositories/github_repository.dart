import 'package:github/feature/github/domain/entities/github.dart';

abstract class GitHubRepository {
  Future<List<GitHubRepositoryEntity>> getUserRepositories();
}
