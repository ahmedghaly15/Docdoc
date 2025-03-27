import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';
part 'api_error_model.freezed.dart';

@Freezed(toJson: false, fromJson: true)
class ApiErrorModel with _$ApiErrorModel {
  const factory ApiErrorModel({
    int? code,
    String? message,
  }) = _ApiErrorModel;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}
