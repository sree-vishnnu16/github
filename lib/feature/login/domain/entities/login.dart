import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'login.g.dart';

@JsonSerializable(includeIfNull: false)
class LoginEntity extends Equatable {
  final String uid;
  final String? email;
  final String? token;

  LoginEntity({required this.uid, this.email, this.token});

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);

  @override
  List<Object?> get props => [uid, email, token];

  LoginEntity copyWith({
    String? uid,
    String? email,
    String? token,
  }) {
    return LoginEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }
}
