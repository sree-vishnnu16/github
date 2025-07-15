// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      uid: json['uid'] as String,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      if (instance.email case final value?) 'email': value,
      if (instance.token case final value?) 'token': value,
    };
