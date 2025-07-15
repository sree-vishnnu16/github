// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubModel _$GitHubModelFromJson(Map<String, dynamic> json) => GitHubModel(
      name: json['name'] as String?,
      visibility: json['visibility'] as String?,
      default_branch: json['default_branch'] as String?,
    );

Map<String, dynamic> _$GitHubModelToJson(GitHubModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'visibility': instance.visibility,
      'default_branch': instance.default_branch,
    };
