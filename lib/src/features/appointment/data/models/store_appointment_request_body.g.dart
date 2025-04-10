// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_appointment_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreAppointmentRequestBody _$StoreAppointmentRequestBodyFromJson(
        Map<String, dynamic> json) =>
    StoreAppointmentRequestBody(
      doctorId: json['doctor_id'] as int,
      startTime: json['start_time'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$StoreAppointmentRequestBodyToJson(
        StoreAppointmentRequestBody instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'start_time': instance.startTime,
      'notes': instance.notes,
    };
