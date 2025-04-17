import 'package:json_annotation/json_annotation.dart';

import 'doctor.dart';

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
