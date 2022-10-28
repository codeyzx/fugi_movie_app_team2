import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  Endpoints._();

  static String baseURL = dotenv.get('BASE_URL');
  static String baseURLJst = dotenv.get('BASE_URL_JST');
  static const int receiveTimeout = 5000;
  static const int connectionTimeout = 30000;

  static const String trending = '/trending/all/day';
  static const String upcoming = '/movie/upcoming';
}
