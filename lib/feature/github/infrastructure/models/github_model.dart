import 'package:equatable/equatable.dart';
import 'package:github/feature/github/infrastructure/models/owner_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GitHubModel extends Equatable {
  final int? id;
  final String? name;
  final String? visibility;
  final String? default_branch;
  final String? description;
  final OwnerModel? owner;

  GitHubModel({
    this.id,
     this.name,
     this.visibility,
     this.default_branch,
    this.description,
    this.owner,
  });

  @override
  List<Object?> get props => [name, visibility, default_branch];

  factory GitHubModel.fromJson(Map<String, dynamic> json) =>
      _$GitHubModelFromJson({
        ...json,
        'id': json['id'] ?? 0,
        'visibility': json['visibility'] ?? 'public',
        'default_branch': json['default_branch'] ?? 'main',
        'name': json['name'] ?? '',
        'description': json['description'] ?? '',
        'owner': json['owner'] ?? OwnerModel.fromJson(json['owner']).toJson(),
      });

  Map<String, dynamic> toJson() => _$GitHubModelToJson(this);
}
