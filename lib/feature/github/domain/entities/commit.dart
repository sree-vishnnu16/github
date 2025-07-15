import 'package:equatable/equatable.dart';

class CommitEntity extends Equatable {
  final String message;
  final String authorName;
  final String commitDate;

  const CommitEntity({
    required this.message,
    required this.authorName,
    required this.commitDate,
  });

  @override
  List<Object> get props => [message, authorName, commitDate];

  CommitEntity copyWith({
    String? message,
    String? authorName,
    String? commitDate,
  }) {
    return CommitEntity(
      message: message ?? this.message,
      authorName: authorName ?? this.authorName,
      commitDate: commitDate ?? this.commitDate,
    );
  }
}