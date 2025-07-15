import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable(explicitToJson: false)
class OwnerEntity extends Equatable {

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

  const OwnerEntity({
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

  factory OwnerEntity.fromJson(Map<String, dynamic> json) {
    return OwnerEntity(
      login: json['login'],
      id: json['id'],
      node_id: json['node_id'],
      avatar_url: json['avatar_url'],
      gravatar_id: json['gravatar_id'],
      url: json['url'],
      html_url: json['html_url'],
      repos_url: json['repos_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': node_id,
      'avatar_url': avatar_url,
      'gravatar_id': gravatar_id,
      'url': url,
      'html_url': html_url,
    };
  }

  OwnerEntity copyWith({
    String? login,
    int? id,
    String? node_id,
    String? avatar_url,
    String? gravatar_id,
    String? url,
    String? html_url,
    String? repos_url,
    String? events_url,
    String? type,
    bool? site_admin,
    String? name,
    String? company,
  }) {
    return OwnerEntity(
      login: login ?? this.login,
      id: id ?? this.id,
      node_id: node_id ?? this.node_id,
      avatar_url: avatar_url ?? this.avatar_url,
      gravatar_id: gravatar_id ?? this.gravatar_id,
      url: url ?? this.url,
      html_url: html_url ?? this.html_url,
      repos_url: repos_url ?? this.repos_url,
      events_url: events_url ?? this.events_url,
    );
  }
}