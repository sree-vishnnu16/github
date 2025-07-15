// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitModel _$CommitModelFromJson(Map<String, dynamic> json) => CommitModel(
      sha: json['sha'] as String,
      message: json['message'] as String,
      authorName: json['authorName'] as String,
      authorEmail: json['authorEmail'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$CommitModelToJson(CommitModel instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'message': instance.message,
      'authorName': instance.authorName,
      'authorEmail': instance.authorEmail,
      'date': instance.date,
    };
