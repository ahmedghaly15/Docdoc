import 'package:json_annotation/json_annotation.dart';

part 'specialization.g.dart';

@JsonSerializable(explicitToJson: true)
class Specialization {
  final int id;
  final String name;
  final List<Doctor> doctors;

  const Specialization({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final DoctorSpecialization specialization;
  final City city;
  @JsonKey(name: 'appoint_price')
  final int appointPrice;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;

  const Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class DoctorSpecialization {
  final int id;
  final String name;

  const DoctorSpecialization({
    required this.id,
    required this.name,
  });

  factory DoctorSpecialization.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecializationFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorSpecializationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class City {
  final int id;
  final String name;
  final Governrate governrate;

  City({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Governrate {
  final int id;
  final String name;

  Governrate({required this.id, required this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);
  Map<String, dynamic> toJson() => _$GovernrateToJson(this);
}
