import 'dart:convert';

import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/cache_helper.dart';
import '../helpers/cache_keys.dart';

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

  static Future<void> secureUser({
    required String userToken,
    required UserModel user,
  }) async {
    CacheHelper.setSecuredString(
      CacheKeys.user,
      json.encode(user.copyWith(token: userToken).toJson()),
    );
  }

  static Future<UserModel?> getSecuredUser() async {
    String? cachedUser = await CacheHelper.getSecuredString(CacheKeys.user);
    if (cachedUser.isNullOrEmpty) {
      return null;
    }
    return UserModel.fromJson(json.decode(cachedUser));
  }
}
