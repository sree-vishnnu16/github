
import 'package:equatable/equatable.dart';

class HeadCommitEntity extends Equatable {
  final String sha;
  final String url;

  const HeadCommitEntity({
    required this.sha,
    required this.url,
  });

  @override
  List<Object?> get props => [sha, url];
}