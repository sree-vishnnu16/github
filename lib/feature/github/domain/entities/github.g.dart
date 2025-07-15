// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubRepositoryEntity _$GitHubRepositoryEntityFromJson(
        Map<String, dynamic> json) =>
    GitHubRepositoryEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      default_branch: json['default_branch'] as String,
      description: json['description'] as String,
      owner: OwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GitHubRepositoryEntityToJson(
        GitHubRepositoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visibility': instance.visibility,
      'default_branch': instance.default_branch,
      'description': instance.description,
      'owner': instance.owner,
    };
