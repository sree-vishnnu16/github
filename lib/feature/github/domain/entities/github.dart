
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github.g.dart';

@JsonSerializable(explicitToJson: false)
class GitHubRepositoryEntity  extends Equatable {
  final String name;
  final String visibility;
  final String default_branch;

  GitHubRepositoryEntity({
    required this.name,
    required this.visibility,
    required this.default_branch,
  });

  @override
  List<Object?> get props => [name, visibility, default_branch];

  factory GitHubRepositoryEntity.fromJson(Map<String, dynamic> json) {
    return GitHubRepositoryEntity(
      name: json['name'],
      visibility: json['visibility'],
      default_branch: json['default_branch'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'visibility': visibility,
      'default_branch': default_branch,
    };
  }

  GitHubRepositoryEntity copyWith({
    String? name,
    String? visibility,
    String? default_branch,
  }) {
    return GitHubRepositoryEntity(
      name: name ?? this.name,
      visibility: visibility ?? this.visibility,
      default_branch: default_branch ?? this.default_branch,
    );
  }

}

