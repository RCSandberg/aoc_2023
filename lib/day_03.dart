import 'package:aoc_2023/helpers/is_digit.dart';
import 'package:aoc_2023/helpers/read_file_helper.dart';

var digitRE = RegExp(r'(\d+)');
var symbolRE = RegExp(r'[^\.\d]');

Future<int> day3A(String inputFile) async {
  var lines = await readFileAsLines(inputFile);
  var map = List<List<String>>.from(lines.map((e) => List<String>.from(e.split(''))));
  var sum = 0;
  for (var y = 0; y < map.length; y++) {
    var row = map[y];
    var maxX = row.length - 1;
    String? currentNum;
    var hasSymbol = false;
    for (var x = 0; x < row.length; x++) {
      var col = row[x];
      if (isDigit(col)) {
        currentNum = currentNum == null ? col : '$currentNum$col';
        if (!hasSymbol) {
          hasSymbol = checkSurroundings(y, x, map, symbolRE) != null;
        }
        if (x == maxX && hasSymbol) {
          sum += int.parse(currentNum);
          hasSymbol = false;
          currentNum = null;
        }
      } else {
        if (hasSymbol && currentNum != null) {
          sum += int.parse(currentNum);
        }
        hasSymbol = false;
        currentNum = null;
      }
    }
  }

  return sum;
}

String? checkSurroundings(int y, int x, List<List<String>> map, RegExp re) {
  var maxY = map.length - 1;
  var maxX = map.first.length - 1;
  if (y > 0) {
    if (re.hasMatch(map[y - 1][x])) {
      return '${y - 1},$x';
    }
    if (x > 0) {
      if (re.hasMatch(map[y - 1][x - 1])) {
        return '${y - 1},${x - 1}';
      }
    }
    if (x < maxX) {
      if (re.hasMatch(map[y - 1][x + 1])) {
        return '${y - 1},${x + 1}';
      }
    }
  }
  if (y < maxY) {
    if (re.hasMatch(map[y + 1][x])) {
      return '${y + 1},$x';
    }
    if (x > 0) {
      if (re.hasMatch(map[y + 1][x - 1])) {
        return '${y + 1},${x - 1}';
      }
    }
    if (x < maxX) {
      if (re.hasMatch(map[y + 1][x + 1])) {
        return '${y + 1},${x + 1}';
      }
    }
  }
  if (x > 0) {
    if (re.hasMatch(map[y][x - 1])) {
      return '$y,${x - 1}';
    }
  }
  if (x < maxX) {
    if (re.hasMatch(map[y][x + 1])) {
      return '$y,${x + 1}';
    }
  }
  return null;
}

var gearRE = RegExp(r'[\*]');

Future<int> day3B(String inputFile) async {
  var lines = await readFileAsLines(inputFile);
  var map = List<List<String>>.from(lines.map((e) => List<String>.from(e.split(''))));
  var sum = 0;
  var gearMap = <String, List<String>>{};

  for (var y = 0; y < map.length; y++) {
    var row = map[y];
    var maxX = row.length - 1;
    String? currentNum;
    String? symbolCoord;
    for (var x = 0; x < row.length; x++) {
      var col = row[x];
      if (isDigit(col)) {
        currentNum = currentNum == null ? col : '$currentNum$col';
        if (symbolCoord == null) {
          symbolCoord = checkSurroundings(y, x, map, gearRE);
        }
        if (x == maxX && symbolCoord != null) {
          if (gearMap[symbolCoord] != null) {
            gearMap[symbolCoord]!.add(currentNum);
          } else {
            gearMap[symbolCoord] = [currentNum];
          }
        }
      } else {
        if (symbolCoord != null && currentNum != null) {
          if (gearMap[symbolCoord] != null) {
            gearMap[symbolCoord]!.add(currentNum);
          } else {
            gearMap[symbolCoord] = [currentNum];
          }
        }
        symbolCoord = null;
        currentNum = null;
      }
    }
  }

  sum = gearMap.values.fold(0, (p, list) => list.length == 2 ? p + int.parse(list[0]) * int.parse(list[1]) : p);

  return sum;
}
