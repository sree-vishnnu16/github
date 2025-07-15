// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'head_commit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadCommitModel _$HeadCommitModelFromJson(Map<String, dynamic> json) =>
    HeadCommitModel(
      sha: json['sha'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$HeadCommitModelToJson(HeadCommitModel instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'url': instance.url,
    };
