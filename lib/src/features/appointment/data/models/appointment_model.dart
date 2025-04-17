import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/doctor.dart';

part 'appointment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppointmentModel {
  final int id;
  final Doctor doctor;
  final Patient patient;
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  @JsonKey(name: 'appointment_end_time')
  final String appointmentEndTime;
  final String notes, status;
  @JsonKey(name: 'appointment_price')
  final int appointmentPrice;

  AppointmentModel({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.notes,
    required this.status,
    required this.appointmentPrice,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}

@JsonSerializable()
class Patient {
  final int id;
  final String name, email, phone, gender;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
