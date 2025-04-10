// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentHash() => r'a2c94248f2d1a9d8a21efb1cb5b67e7a5ecb5a7c';

/// See also [Appointment].
@ProviderFor(Appointment)
final appointmentProvider =
    AutoDisposeAsyncNotifierProvider<Appointment, ApiResponse<Appointment>>.internal(
  Appointment.new,
  name: r'appointmentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appointmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Appointment = AutoDisposeAsyncNotifier<ApiResponse<Appointment>>;
