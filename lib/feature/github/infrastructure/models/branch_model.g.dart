// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      name: json['name'] as String?,
      headCommit: json['commit'] == null
          ? null
          : HeadCommitModel.fromJson(json['commit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'commit': instance.headCommit?.toJson(),
    };
