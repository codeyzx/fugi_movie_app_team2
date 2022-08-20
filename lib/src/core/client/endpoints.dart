import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  Endpoints._();

  static String baseURL = dotenv.get('BASE_URL');
  static String baseURLJst = dotenv.get('BASE_URL_JST');
  static const int receiveTimeout = 5000;
  static const int connectionTimeout = 30000;
  //Auth
  static const String refreshToken = '/api/v1/auth/refresh-token';
  static const String loginUrl = '/api/v1/login';
  static const String authLoginUrl = '/api/v1/auth/login';
  static const String otpGenerate = '/api/v1/otp/generate';
  static const String otpVerify = '/api/v1/otp/verify';
  static const String verifyWeakPin = '/api/v1/pin/check-strength';
  static const String createPin = '/api/v1/pin/create';
  static const String verifyPin = '/api/v1/pin/verify';
  static const String validateOldPin = '/api/v1/pin/validate-old-pin';
  static const String changePin = '/api/v1/pin/change'; //🔐 JWT Required
  static const String forgotPin = '/api/v1/pin/forgot';
  static const String uploadImage = '/api/v1/upload/img-profile'; //🔐 JWT Required
  //Employee
  static const String findEmployeeUrl = '/api/v1/employees';
  static const String findRegisteredPhonesUrl = '/api/v1/phones';
  //upload image
  static const String uploadImageUrl = '/api/v1/upload-file';
  //meetings
  static const String requestMeetingUrl = '/api/v1/registers/meeting';
  static const String requestVisitUrl = '/api/v1/registers/visit';
  //invitation
  static const String invitationsUrl = '/api/v1/invitations';
  static const String invitationsDetailUrl = '/api/v1/invitation-detail';

  static const String userImageUrl = '/api/v1/user-image';

  static const String emptyEndpoints = '/api/v1/empty-endpoints';

  static const String daftarPengajuan = '/api/v1/daftar-pengajuan';
  static const String daftarApproval = '/api/v1/daftar-approval';
  static const String daftarJadwalKunjungan = '/api/v1/daftar-jadwal-kunjungan';
  static const String topFiveInfo = '/api/v1/top-five-info';
  static const String collectionNotification = 'notifications';
  static const String collectionEmployee = 'employees';
}
