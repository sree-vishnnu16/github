import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OwnerModel extends Equatable {
  final String? login;
  final int? id;
  final String? node_id;
  final String? avatar_url;
  final String? gravatar_id;
  final String? url;
  final String? html_url;
  final String? repos_url;
  final String? events_url;
  final String? type;
  final bool? site_admin;
  final String? name;
  final String? company;

  const OwnerModel({
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.repos_url,
    this.events_url,
    this.type,
    this.site_admin,
    this.name,
    this.company,
  });

  @override
  List<Object?> get props => [
        login,
        id,
        node_id,
        avatar_url,
        gravatar_id,
        url,
        html_url,
        repos_url,
        events_url,
        type,
        site_admin,
        name,
        company,
      ];

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson({
        ...json,
        'login': json['login'] ?? '',
        'id': json['id'] ?? 0,
        'node_id': json['node_id'] ?? '',
        'avatar_url': json['avatar_url'] ?? '',
        'gravatar_id': json['gravatar_id'] ?? '',
        'url': json['url'] ?? '',
        'html_url': json['html_url'] ?? '',
        'repos_url': json['repos_url'] ?? '',
        'events_url': json['events_url'] ?? '',
        'type': json['type'] ?? '',
        'site_admin': json['site_admin'] ?? false,
        'name': json['name'] ?? '',
        'company': json['company'] ?? '',
      });

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}
