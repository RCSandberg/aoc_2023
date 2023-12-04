import 'dart:math';

import 'package:aoc_2023/helpers/read_file_helper.dart';

var wsre = RegExp(r'\s+');
var cardIdRe = RegExp(r'Card (\d+):');

Future<int> day4A(String inputFile) async {
  var lines = await readFileAsLines(inputFile);
  var games = List<List<List<int>>>.from(lines.map((l) {
    var split = l.split(':')[1].split('|');
    var winnings = split[0].trim().replaceAll(wsre, ' ').split(' ').map((e) => int.parse(e.trim())).toList();
    var myNums = split[1].trim().replaceAll(wsre, ' ').split(' ').map((e) => int.parse(e.trim())).toList();
    return [winnings, myNums];
  }));
  var sum = 0;

  for (var game in games) {
    var corrects = 0;
    for (var n in game[1]) {
      game[0].contains(n) ? corrects++ : 0;
    }
    sum += pow(2, corrects - 1).toInt();
  }

  return sum;
}

Future<int> day4B(String inputFile) async {
  var lines = await readFileAsLines(inputFile);
  var games = List<List<List<int>>>.from(lines.map((l) {
    var split = l.split(':')[1].split('|');
    var winnings = split[0].trim().replaceAll(wsre, ' ').split(' ').map((e) => int.parse(e.trim())).toList();
    var myNums = split[1].trim().replaceAll(wsre, ' ').split(' ').map((e) => int.parse(e.trim())).toList();
    return [winnings, myNums];
  }));

  var cardId = 1;
  var cardCount = {for (var _ in games) cardId++: 1};

  for (int i = 0; i < games.length; i++) {
    var game = games[i];
    var corrects = 0;
    for (var n in game[1]) {
      game[0].contains(n) ? corrects++ : 0;
    }

    var gameId = i + 1;
    for (var j = 1; j < corrects + 1; j++) {
      var extraCardId = gameId + j;
      cardCount[extraCardId] = cardCount[extraCardId]! + cardCount[gameId]!;
    }
  }

  return cardCount.values.reduce((value, element) => value + element);
}
