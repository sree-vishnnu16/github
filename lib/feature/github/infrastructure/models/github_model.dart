import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GitHubModel extends Equatable {
  final String? name;
  final String? visibility;
  final String? default_branch;

  GitHubModel({
    required this.name,
    required this.visibility,
    required this.default_branch,
  });

  @override
  List<Object?> get props => [name, visibility, default_branch];

  factory GitHubModel.fromJson(Map<String, dynamic> json) =>
      _$GitHubModelFromJson({
        ...json,
        'visibility': json['visibility'] ?? 'public',
        'default_branch': json['default_branch'] ?? 'main',
        'name': json['name'] ?? '',
      });

  Map<String, dynamic> toJson() => _$GitHubModelToJson(this);
}
