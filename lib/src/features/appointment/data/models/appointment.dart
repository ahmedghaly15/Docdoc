part 'appointment.g.dart';

@JsonSerializable(explicitToJson: true)
class Appointment{
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

Appointment({
  required this.id,
  required this.doctor,
  required this.patient,
  required this.appointmentTime,
  required this.appointmentEndTime,
  required this.notes,
  required this.status,
  required this.appointmentPrice,
});

factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

@JsonSerializable()
class Patient{
final int id;
final String name, email, phone, gender;

Patient({
required this.id,
required this.name,
required this.email,
required this.phone,
required this.gender,
});

factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

Map<String, dynamic> toJson() => _$PatientToJson(this);
}
