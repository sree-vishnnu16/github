abstract class GitHubEvent {}

class FetchRepositories extends GitHubEvent {}

class FetchRepoBranchesWithCommits extends GitHubEvent {
  final String owner;
  final String repo;

  FetchRepoBranchesWithCommits({required this.owner, required this.repo});
}
