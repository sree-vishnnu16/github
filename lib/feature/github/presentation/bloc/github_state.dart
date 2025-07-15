import 'package:github/feature/github/domain/entities/branch.dart';
import 'package:github/feature/github/domain/entities/github.dart';

abstract class GitHubState {}

class GitHubInitial extends GitHubState {}

class GitHubLoading extends GitHubState {}

class GitHubLoaded extends GitHubState {
  final List<GitHubRepositoryEntity> repositories;

  GitHubLoaded(this.repositories);
}

class GitHubError extends GitHubState {
  final String message;

  GitHubError(this.message);
}

class RepoDetailLoading extends GitHubState {}

class RepoDetailLoaded extends GitHubState {
  final List<BranchEntity> branches;

  RepoDetailLoaded(this.branches);
}

class RepoDetailError extends GitHubState {
  final String message;

  RepoDetailError(this.message);
}
