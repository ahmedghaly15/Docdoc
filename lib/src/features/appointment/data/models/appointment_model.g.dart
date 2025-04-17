// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num).toInt(),
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentTime: json['appointment_time'] as String,
      appointmentEndTime: json['appointment_end_time'] as String,
      notes: json['notes'] as String,
      status: json['status'] as String,
      appointmentPrice: (json['appointment_price'] as num).toInt(),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor.toJson(),
      'patient': instance.patient.toJson(),
      'appointment_time': instance.appointmentTime,
      'appointment_end_time': instance.appointmentEndTime,
      'notes': instance.notes,
      'status': instance.status,
      'appointment_price': instance.appointmentPrice,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
    };
