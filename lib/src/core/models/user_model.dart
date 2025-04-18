import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/cache_helper.dart';
import '../helpers/cache_keys.dart';
import '../utils/app_constants.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? token,
    @JsonKey(name: 'username') String? userName,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? gender,
    int? id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static Future<void> secureUser(UserModel user) async {
    currentUser = user;
    await CacheHelper.setSecuredString(
      CacheKeys.user,
      json.encode(user.toJson()),
    );
  }

  static Future<UserModel?> getSecuredUser() async {
    final cachedUser = await CacheHelper.getSecuredString(CacheKeys.user);
    return UserModel.fromJson(json.decode(cachedUser));
  }
}
