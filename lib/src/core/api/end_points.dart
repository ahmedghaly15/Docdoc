class EndPoints {
  static const String baseUrl = 'https://vcare.integration25.com/api/';
  static const String authUrl = 'auth/';
  static const String login = '${authUrl}login';
  static const String register = '${authUrl}register';
  static const String specialization = 'specialization/index';
  static const String user = 'user/';
  static const String fetchUserProfile = '${user}profile';
  static const String updateUserProfile = '${user}update';
  static const String appointment = 'appointment/';
  static const String fetchAppointments = '${appointment}index';
  static const String storeAppointment = '${appointment}store';
  static const String doctor = 'doctor/';
  static const String fetchDoctors = '${doctor}index';
  static const String filterDoctorsByCity = '${doctor}doctor-filter';
}
