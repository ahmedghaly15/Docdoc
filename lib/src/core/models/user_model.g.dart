// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      token: json['token'] as String?,
      userName: json['username'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.userName,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
      'id': instance.id,
    };
