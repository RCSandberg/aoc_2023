import 'dart:math';

import 'package:aoc_2023/helpers/read_file_helper.dart';

Future<int> day2A(String inputFile) async {
  return day2ALines(await readFileAsLines(inputFile));
}

Future<int> day2B(String inputFile) async {
  return day2BLines(await readFileAsLines(inputFile));
}

var digitRE = RegExp(r'(\d+)');
var cubeRegEx = RegExp(r'(\d+ blue)|(\d+ green)|(\d+ red)');

Future<int> day2ALines(List<String> inputLines) async {
  var games = <int, bool>{};

  for (var line in inputLines) {
    var splitLine = line.split(':');
    // Init id
    var id = int.parse(digitRE.firstMatch(splitLine[0])!.group(0)!);
    games[id] = true;

    var presentations = splitLine[1].split(';');
    for (var presentation in presentations) {
      var pm = cubeRegEx.allMatches(presentation);
      for (var m in pm) {
        var cubeCount = m.group(0)!;
        var count = int.parse(digitRE.firstMatch(cubeCount)!.group(0)!);
        if (cubeCount.contains('blue') && count > 14) {
          games[id] = false;
        } else if (cubeCount.contains('green') && count > 13) {
          games[id] = false;
        } else if (cubeCount.contains('red') && count > 12) {
          games[id] = false;
        }
      }
    }
  }
  return games.map((key, value) => MapEntry(value ? key : 0, value)).keys.reduce((value, element) => value + element);
}

Future<int> day2BLines(List<String> inputLines) async {
  var games = <int, int>{};

  for (var line in inputLines) {
    var splitLine = line.split(':');
    // Init id
    var id = int.parse(digitRE.firstMatch(splitLine[0])!.group(0)!);
    games[id] = 1;
    var presentations = splitLine[1].split(';');

    int maxRed = 1;
    int maxBlue = 1;
    int maxGreen = 1;

    for (var presentation in presentations) {
      var pm = cubeRegEx.allMatches(presentation);
      for (var m in pm) {
        var cubeCount = m.group(0)!;
        var count = int.parse(digitRE.firstMatch(cubeCount)!.group(0)!);
        if (cubeCount.contains('blue')) {
          maxBlue = max(count, maxBlue);
        } else if (cubeCount.contains('green')) {
          maxGreen = max(count, maxGreen);
        } else if (cubeCount.contains('red')) {
          maxRed = max(count, maxRed);
        }
      }
    }
    var power = maxRed * maxGreen * maxBlue;
    games[id] = power;
  }
  return games.values.reduce((value, element) => value + element);
}
