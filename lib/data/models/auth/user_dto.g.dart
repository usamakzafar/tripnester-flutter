// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      name: json['name'] as String?,
      roles:
          (json['roles'] as List<dynamic>)
              .map((e) => RoleDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      phoneNumber: json['phoneNumber'] as String?,
      avatar: json['avatar'] as String?,
      onboardingCompleted: json['onboardingCompleted'] as bool,
      isOAuthAccount: json['isOAuthAccount'] as bool,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'roles': instance.roles,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'onboardingCompleted': instance.onboardingCompleted,
      'isOAuthAccount': instance.isOAuthAccount,
    };
