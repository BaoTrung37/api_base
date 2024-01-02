import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatDateTime => DateFormat('yyyy-MM-dd').format(this);
}
