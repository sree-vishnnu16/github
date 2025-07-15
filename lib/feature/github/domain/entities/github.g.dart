// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubRepositoryEntity _$GitHubRepositoryEntityFromJson(
        Map<String, dynamic> json) =>
    GitHubRepositoryEntity(
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      default_branch: json['default_branch'] as String,
    );

Map<String, dynamic> _$GitHubRepositoryEntityToJson(
        GitHubRepositoryEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'visibility': instance.visibility,
      'default_branch': instance.default_branch,
    };
