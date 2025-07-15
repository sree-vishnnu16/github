
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommitModel extends Equatable {
  final String sha;
  final String message;
  final String authorName;
  final String authorEmail;
  final String date;

  CommitModel({
    required this.sha,
    required this.message,
    required this.authorName,
    required this.authorEmail,
    required this.date,
  });

  @override
  List<Object?> get props => [sha, message, authorName, authorEmail, date];

  factory CommitModel.fromJson(Map<String, dynamic> json)  =>
   _$CommitModelFromJson({
     ...json,
     "sha": json['sha'] ?? '',
     "message": json['commit']?['message'] ?? '',
     "authorName": json['commit']?['author']?['name'] ?? '',
     "authorEmail": json['commit']?['author']?['email'] ?? '',
     "date": json['commit']?['author']?['date'] ?? '',
   });

  Map<String, dynamic> toJson() => _$CommitModelToJson(this);

}
