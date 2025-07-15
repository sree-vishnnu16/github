import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/feature/github/application/use_cases/github_use_cases.dart';
import 'package:github/feature/github/domain/entities/branch.dart';
import 'github_event.dart';
import 'github_state.dart';

class GitHubBloc extends Bloc<GitHubEvent, GitHubState> {
  final GetUserRepositoriesUseCase getUserRepositories;

  GitHubBloc(this.getUserRepositories) : super(GitHubInitial()) {
    on<FetchRepositories>((event, emit) async {
      emit(GitHubLoading());
      try {
        final repos = await getUserRepositories.getAllRepos();
        emit(GitHubLoaded(repos));
      } catch (e) {
        emit(GitHubError(e.toString()));
      }
    });

    on<FetchRepoBranchesWithCommits>((event, emit) async {
      emit(RepoDetailLoading());
      try {
        final branches = await getUserRepositories.getBranches(event.owner, event.repo);
        // List<BranchEntity> branchEntities = [];
        // for (var branch in branches) {
        //   final commits = await getUserRepositories.getCommits(event.owner, event.repo, branch.name);
        //   branch.copyWith(commits: commits);
        //   branchEntities.add(branch);
        // }
        emit(RepoDetailLoaded(branches));
      } catch (e) {
        emit(RepoDetailError(e.toString()));
      }
    });
  }
}
