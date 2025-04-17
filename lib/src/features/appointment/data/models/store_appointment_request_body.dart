import 'package:json_annotation/json_annotation.dart';

part 'store_appointment_request_body.g.dart';

@JsonSerializable()
class StoreAppointmentRequestBody {
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'start_time')
  final String startTime;
  final String notes;

  StoreAppointmentRequestBody({
    required this.doctorId,
    required this.startTime,
    required this.notes,
  });

  factory StoreAppointmentRequestBody.fromJson(Map<String, dynamic> json) =>
      _$StoreAppointmentRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$StoreAppointmentRequestBodyToJson(this);
}
