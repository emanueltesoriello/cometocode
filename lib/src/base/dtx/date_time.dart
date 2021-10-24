import 'package:date_format/date_format.dart';

//example of how to use the extension
extension DateTimeExt on DateTime {
  String get ddmmyyyy => formatDate(this, [dd, "/", mm, "/", yyyy]);
}
