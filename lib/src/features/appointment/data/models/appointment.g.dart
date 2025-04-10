// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as int,
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentTime: json['appointment_time'] as String,
      appointmentEndTime: json['appointment_end_time'] as String,
      notes: json['notes'] as String,
      status: json['status'] as String,
      appointmentPrice: json['appointment_price'] as int,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
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
      id: json['id'] as int,
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
