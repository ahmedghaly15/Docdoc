import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error_message.dart';

part 'api_error_model.g.dart';
part 'api_error_model.freezed.dart';

@Freezed(toJson: false, fromJson: true)
class ApiErrorModel with _$ApiErrorModel {
  // A private constructor to keep _getAllErrorMessages private while keeping getAllErrorMessages accessible.
  const ApiErrorModel._();

  const factory ApiErrorModel({
    int? code,
    String? message,
    @JsonKey(name: 'data') dynamic errors,
  }) = _ApiErrorModel;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  String get getAllErrorMessages => _getAllErrorMessages();
  String _getAllErrorMessages() {
    if (errors == null || (errors is List && (errors as List).isEmpty)) {
      return message ?? ApiErrorMessage.defaultError;
    }

    if (errors is Map<String, dynamic>) {
      final errorMsg = (errors as Map<String, dynamic>).entries.map((entry) {
        final entryValue = entry.value;
        return entryValue is List
            ? entryValue.join(',')
            : entryValue.toString();
      }).join('\n');
      return errorMsg;
    } else if (errors is List) {
      return (errors as List).join('\n');
    }
    return message ?? ApiErrorMessage.defaultError;
  }
}

// extension ApiErrorModelExtension on ApiErrorModel {
//   String get getAllErrorMessages => _getAllErrorMessages();

//   String _getAllErrorMessages() {
//     if (errors == null || (errors is List && (errors as List).isEmpty)) {
//       return message ?? ApiErrorMessage.defaultError;
//     }

//     if (errors is Map<String, dynamic>) {
//       final errorMsg = (errors as Map<String, dynamic>).entries.map((entry) {
//         final entryValue = entry.value;
//         return entryValue is List
//             ? entryValue.join(',')
//             : entryValue.toString();
//       }).join('\n');
//       return errorMsg;
//     } else if (errors is List) {
//       return (errors as List).join('\n');
//     }
//     return message ?? ApiErrorMessage.defaultError;
//   }
// }
