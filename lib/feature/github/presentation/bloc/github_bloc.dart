import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/feature/github/application/use_cases/github_use_cases.dart';
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
  }
}
