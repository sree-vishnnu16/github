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
