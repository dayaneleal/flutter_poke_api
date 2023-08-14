import 'package:intl/intl.dart';

extension ExtendedString on String {
  String get extractNumber {
    var list = split('https://pokeapi.co/api/v2/pokemon/');
    String result = list[list.length - 1].replaceAll(RegExp('[^0-9]'), '');
    return result;
  }
}

extension ExtendedNumber on int {
  String get formatNumber {
    return NumberFormat('000').format(this).toString();
  }
}

