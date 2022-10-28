import 'dart:io';
import 'dart:math';

import 'package:intl/intl.dart';

/// Example event class.
class Event {
  final String title;
  const Event(this.title);
  @override
  String toString() => title;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

String maskingPhone(String paramPhone) {
  String results = paramPhone;
  if (results.length > 3) {
    String asterixChar = generateAsterix(results.length - 3);
    results = results.replaceRange(0, (results.length - 3), asterixChar);
  } else {
    results = '***???***';
  }
  return results;
}

String maskingReservationNumber(String paramReservationNo) {
  String results = '';
  String first4digits = paramReservationNo.substring(0, 4);
  String lastDigits = paramReservationNo.substring(4, paramReservationNo.length);
  results = '$first4digits$lastDigits';
  return results;
}

String maskingEmail(String paramEmail) {
  String results = paramEmail;
  if (results.length > 3) {
    var emailName = results.split('@')[0];
    var emailDomain = results.split('@')[1];
    String asterixChar = generateAsterix(emailName.length - 3);
    results = '${emailName.replaceRange(3, (emailName.length), asterixChar)}@$emailDomain';
  } else {
    results = '***???***@***.***';
  }
  return results;
}

String generateAsterix(int length) {
  String hasil = '';
  for (int i = 0; i < length; i++) {
    hasil += '*';
  }
  return hasil;
}

String simpleDateFormat(String? date) {
  DateFormat indoDateFormat = DateFormat('EEEE, d MMM yyy', 'id');
  return indoDateFormat.format(DateTime.parse(date ?? DateTime.now().toString()));
}

String simpleDateTimestampFormat(String? date) {
  DateFormat indoDateFormat = DateFormat('EEEE, d MMM yyy', 'id');
  var datex = DateTime.fromMillisecondsSinceEpoch(int.parse(date!) * 1000);
  return indoDateFormat.format(DateTime.parse(datex.toString()));
}

String simpleDateTimeFormat(String? date) {
  DateFormat indoDateFormat = DateFormat('EEEE, d MMM yyy HH:mm a', 'id');
  return indoDateFormat.format(DateTime.parse(date ?? DateTime.now().toString()));
}

String postDateFormat(String? date) {
  DateFormat indoDateFormat = DateFormat('yyyy-MM-dd', 'id');
  return indoDateFormat.format(DateTime.parse(date ?? DateTime.now().toString()));
}

String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

String urlWhatsApp(String phone, [String? message]) {
  if (Platform.isAndroid) {
    // add the [https]
    return "https://wa.me/$phone/?text=${Uri.parse(message!)}"; // new line
  } else {
    // add the [https]
    return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message!)}"; // new line
  }
}

String getThousandSeparator(double value) {
  var formatter = NumberFormat('#,##,000');
  return formatter.format(double.parse(value.toString()));
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 1000 * 12742 * asin(sqrt(a)); //m
}
