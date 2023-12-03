import 'package:aoc_2023/helpers/read_file_helper.dart';

import 'helpers/is_digit.dart';

Future<int> day1A(String inputFile) async {
  var input = await readFileAsLines(inputFile);
  var sum = input.fold(0, (p, c) {
    var firstDigit = c[c.indexOf(RegExp(r'(\d)'))];
    var secondDigit = c[c.lastIndexOf(RegExp(r'(\d)'))];
    var finalDigit = "$firstDigit$secondDigit";
    return int.parse(finalDigit) + p;
  });
  return sum;
}

Future<int> day1B(String inputFile) async {
  var input = await readFileAsLines(inputFile);
  var sum = input.fold(0, (p, c) {
    var regExp = RegExp(r'(?=(\d|one|two|three|four|five|six|seven|eight|nine))');
    var matches = regExp.allMatches(c).toList();
    var firstMatch = charsAsDigit(matches.first.group(1)!);
    var lastMatch = charsAsDigit(matches.last.group(1)!);

    var finalDigit = "$firstMatch$lastMatch";
    var parsed = int.parse(finalDigit);
    if (parsed > 99 || parsed < 11) {
      throw 'wrong number';
    }
    return parsed + p;
  });
  return sum;
}

String charsAsDigit(String s1) {
  if (isDigit(s1)) {
    return s1;
  }
  switch (s1) {
    case 'one':
      return '1';
    case 'two':
      return '2';
    case 'three':
      return '3';
    case 'four':
      return '4';
    case 'five':
      return '5';
    case 'six':
      return '6';
    case 'seven':
      return '7';
    case 'eight':
      return '8';
    case 'nine':
      return '9';
  }
  throw 'bad';
}
