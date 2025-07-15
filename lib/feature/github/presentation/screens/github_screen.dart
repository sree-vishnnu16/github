import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/core/routes/routes.dart';
import 'package:github/feature/github/presentation/bloc/github_bloc.dart';
import 'package:github/feature/github/presentation/bloc/github_event.dart';
import 'package:github/feature/github/presentation/bloc/github_state.dart';
import 'package:github/feature/github/presentation/screens/repo_detail_screen.dart'
    show RepoDetailScreen;

class GitHubListView extends StatefulWidget {
  const GitHubListView({Key? key}) : super(key: key);

  @override
  State<GitHubListView> createState() => _GitHubListViewState();
}

class _GitHubListViewState extends State<GitHubListView> {
  @override
  void initState() {
    super.initState();
    // Optionally fetch repositories when widget is created
    initialLoad();
  }

  void initialLoad() {
    context.read<GitHubBloc>().add(FetchRepositories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GitHubBloc, GitHubState>(
      builder: (context, state) {
        if (state is GitHubLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GitHubLoaded) {
          final repos = state.repositories;
          return ListView.builder(
            itemCount: repos.length,
            itemBuilder: (context, index) {
              final repo = repos[index];
              return ListTile(
                  title: Text(repo.name),
                  subtitle: Text(
                      'Visibility: ${repo.visibility} • Branch: ${repo.default_branch}'),
                  leading: Icon(
                    repo.visibility == 'private' ? Icons.lock : Icons.public,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.repoDetail,
                            arguments: RepoDetailScreen(
                                owner: repo.owner.login ?? '',
                                repo: repo.name ?? ''))
                        .then((value) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        initialLoad();
                      });
                    });
                  });
            },
          );
        } else if (state is GitHubError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('Loading...'));
      },
    );
  }
}
