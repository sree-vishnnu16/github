
import 'package:github/feature/github/infrastructure/models/head_commit_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'branch_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BranchModel extends Equatable {
  final String? name;

  @JsonKey(name: 'commit') // Maps JSON 'commit' key to 'headCommit' field
  final HeadCommitModel? headCommit;

  const BranchModel({
    this.name,
    this.headCommit,
  });

  @override
  List<Object?> get props => [name, headCommit];

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);

}