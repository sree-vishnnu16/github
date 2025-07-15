// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubModel _$GitHubModelFromJson(Map<String, dynamic> json) => GitHubModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      visibility: json['visibility'] as String?,
      default_branch: json['default_branch'] as String?,
      description: json['description'] as String?,
      owner: json['owner'] == null
          ? null
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GitHubModelToJson(GitHubModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visibility': instance.visibility,
      'default_branch': instance.default_branch,
      'description': instance.description,
      'owner': instance.owner?.toJson(),
    };
