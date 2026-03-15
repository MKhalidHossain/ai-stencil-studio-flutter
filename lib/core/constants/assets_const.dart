class AssetsConst {
  static Images get images => Images();
  static Videos get videos => Videos();
  static Sounds get sounds => Sounds();
  static Icons get icons => Icons();
}

class Images {
  static const String _base = 'assets/images';
  final String appLogo = "$_base/app_logo.png";

  // Onboarding
  final String onboarding_1 = "$_base/onboarding_1.png";
  final String onboarding_2 = "$_base/onboarding_2.png";
  final String onboarding_3 = "$_base/onboarding_3.png";
}

class Videos {
  static const String _base = 'assets/videos';
  final String awd = _base;
}

class Sounds {
  static const String _base = 'assets/sounds';
  final String alarmTest = "$_base/alarm.mp3";
}

class Icons {
  static const String _base = 'assets/icons';

  final String home = "$_base/home.svg";
  final String homeSelected = "$_base/home_selected.svg";

  final String doctor = "$_base/doctor.svg";
  final String doctorSelected = "$_base/doctor_selected.svg";

  final String pharmacy = "$_base/pharmacy.svg";
  final String pharmacySelected = "$_base/pharmacy_selected.svg";
  final String messageCircle = "$_base/message_circle.svg";

  final String profile = "$_base/profile.svg";
  final String profileSelected = "$_base/profile_selected.svg";
  final String personalDetails = "$_base/personal_details.svg";
  final String personGroup = "$_base/person_group.svg";
  final String message = "$_base/message.svg";
  final String notification = "$_base/notification.svg";
  final String info = "$_base/info.svg";
  final String lock = "$_base/lock.svg";
  final String logout = "$_base/logout.svg";

  final String chatList = "$_base/chat_list.svg";
  final String chatListSelected = "$_base/chat_list_selected.svg";

  final String schedule = "$_base/schedule.svg";
  final String scheduleSelected = "$_base/schedule_selected.svg";

  final String medicineBg = "$_base/medicine_bg.svg";
  final String selectRolePatient = "$_base/select_role_profile.svg";
  final String selectRoleDoctor = "$_base/select_role_doctor.svg";
  final String selectRolePharmacist = "$_base/select_role_medicine.svg";
}
