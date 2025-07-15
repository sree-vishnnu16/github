import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/feature/github/presentation/bloc/github_bloc.dart';
import 'package:github/feature/github/presentation/bloc/github_event.dart';
import 'package:github/feature/github/presentation/bloc/github_state.dart';

class RepoDetailScreen extends StatefulWidget {
  final String owner;
  final String repo;

  RepoDetailScreen({required this.owner, required this.repo});

  @override
  State<RepoDetailScreen> createState() => _RepoDetailScreenState();
}

class _RepoDetailScreenState extends State<RepoDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GitHubBloc>().add(
          FetchRepoBranchesWithCommits(owner: widget.owner, repo: widget.repo),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.repo)),
      body: BlocBuilder<GitHubBloc, GitHubState>(
        builder: (context, state) {
          if (state is RepoDetailLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RepoDetailLoaded) {
            return ListView(
              children: state.branches.map((branch) {
                return ExpansionTile(
                  title: Text(branch.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo)),
                  children: branch.commits.map((commit) {
                    return ListTile(
                      title: Text(commit.message),
                      subtitle: Text(
                          '${commit.authorName} • ${DateTime.parse(commit.commitDate).toLocal()}'),
                    );
                  }).toList(),
                );
              }).toList(),
            );
          } else if (state is RepoDetailError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
