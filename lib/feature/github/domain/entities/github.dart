
import 'package:equatable/equatable.dart';
import 'package:github/feature/github/domain/entities/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github.g.dart';

@JsonSerializable(explicitToJson: false)
class GitHubRepositoryEntity  extends Equatable {
  final int id;
  final String name;
  final String visibility;
  final String default_branch;
  final String description;
  final OwnerEntity owner;

  GitHubRepositoryEntity({
    required this.id,
    required this.name,
    required this.visibility,
    required this.default_branch,
    required this.description,
    required this.owner,
  });

  @override
  List<Object?> get props => [name, visibility, default_branch];

  factory GitHubRepositoryEntity.fromJson(Map<String, dynamic> json) {
    return GitHubRepositoryEntity(
      id: json['id'],
      name: json['name'],
      visibility: json['visibility'],
      default_branch: json['default_branch'],
      description: json['description'],
      owner: OwnerEntity.fromJson(json['owner']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'visibility': visibility,
      'default_branch': default_branch,
      'description': description,
      'owner': owner.toJson(),
    };
  }

  GitHubRepositoryEntity copyWith({
    int? id,
    String? name,
    String? visibility,
    String? default_branch,
    String? description,
    OwnerEntity? owner,
  }) {
    return GitHubRepositoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      visibility: visibility ?? this.visibility,
      default_branch: default_branch ?? this.default_branch,
      description: description ?? this.description,
      owner: owner ?? this.owner,
    );
  }

}

