import 'package:equatable/equatable.dart';
import 'package:github/feature/github/domain/entities/commit.dart';
import 'package:github/feature/github/domain/entities/head_commit.dart';

class BranchEntity extends Equatable {
  final String name;
  final HeadCommitEntity headCommit;
  final List<CommitEntity> commits;

  const BranchEntity({
    required this.name,
    required this.headCommit,
    required this.commits,
  });

  @override
  List<Object?> get props => [name, headCommit, commits];

  BranchEntity copyWith({
    String? name,
    HeadCommitEntity? headCommit,
    List<CommitEntity>? commits,
  }) {
    return BranchEntity(
      name: name ?? this.name,
      headCommit: headCommit ?? this.headCommit,
      commits: commits ?? this.commits,
    );
  }
}