// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerEntity _$OwnerEntityFromJson(Map<String, dynamic> json) => OwnerEntity(
      login: json['login'] as String?,
      id: (json['id'] as num?)?.toInt(),
      node_id: json['node_id'] as String?,
      avatar_url: json['avatar_url'] as String?,
      gravatar_id: json['gravatar_id'] as String?,
      url: json['url'] as String?,
      html_url: json['html_url'] as String?,
      repos_url: json['repos_url'] as String?,
      events_url: json['events_url'] as String?,
      type: json['type'] as String?,
      site_admin: json['site_admin'] as bool?,
      name: json['name'] as String?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$OwnerEntityToJson(OwnerEntity instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'gravatar_id': instance.gravatar_id,
      'url': instance.url,
      'html_url': instance.html_url,
      'repos_url': instance.repos_url,
      'events_url': instance.events_url,
      'type': instance.type,
      'site_admin': instance.site_admin,
      'name': instance.name,
      'company': instance.company,
    };
