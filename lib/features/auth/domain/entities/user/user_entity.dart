import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
@JsonSerializable()
class UserEntity with _$UserEntity {
  @override
  final String uid;
  @override
  final String email;
  @override
  final String? name;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.name,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
