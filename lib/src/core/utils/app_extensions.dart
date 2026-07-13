import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextLayout on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension DateExtenstion on DateTime {
  String toFormatDate(String format, {String lang = 'en_US'}) =>
      DateFormat(format).format(this);
}
