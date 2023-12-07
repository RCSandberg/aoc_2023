import 'package:collection/collection.dart';
import 'package:aoc_2023/helpers/read_file_helper.dart';

Future<int> day7A(String inputFile, bool isB) async {
  var lines = await readFileAsLines(inputFile);
  var handToBid = <String, int>{};
  var jokerReplacement = isB ? '1' : 'B';
  lines.forEach((l) {
    var splitted = l.split(' ');
    handToBid[splitted[0]
        .replaceAll('A', 'E')
        .replaceAll('K', 'D')
        .replaceAll('Q', 'C')
        .replaceAll('J', jokerReplacement)
        .replaceAll('T', 'A')] = int.parse(splitted[1]);
  });
  var hands = handToBid.keys.toList();
  hands.sort((a, b) {
    var aType = evaluateHandType(a, isB);
    var bType = evaluateHandType(b, isB);
    if (aType.index == bType.index) {
      for (var i = 0; i < 5; i++) {
        if (a[i] == b[i]) continue;
        return int.parse(a[i], radix: 16).compareTo(int.parse(b[i], radix: 16));
      }
      return 0;
    }
    return aType.index.compareTo(bType.index);
  });
  var sum = 0;

  hands.forEachIndexed((i, hand) {
    sum += handToBid[hand]! * (i + 1);
  });
  return sum;
}

Future<int> day7B(String inputFile, bool isB) async => day7A(inputFile, isB);

enum HandType {
  distinct,
  pair,
  twoPair,
  three,
  full,
  four,
  five,
}

HandType evaluateHandType(String value, bool isB) {
  var cards = value.split('').toSet();
  if (cards.length == 1) return HandType.five;
  var jokerReplacement = isB ? '1' : 'B';
  var edited = value;
  if (isB) {
    var split = edited.replaceAll(jokerReplacement, '').split('');
    var jokerCount = 5 - split.length;
    var mostFreq = mostFrequent(split);
    split.addAll(List.filled(jokerCount, mostFreq));
    edited = split.join('');
  }
  cards = edited.split('').toSet();
  switch (cards.length) {
    case 1:
      return HandType.five;
    case 5:
      return HandType.distinct;
    case 4:
      return HandType.pair;
  }
  if (cards.length == 2) {
    var matches = cards.first.allMatches(edited);
    var length = matches.length;
    if (length == 1 || length == 4) {
      return HandType.four;
    }
    return HandType.full;
  }
  if (cards.length == 3) {
    for (var card in cards) {
      if (card.allMatches(edited).length > 2) {
        return HandType.three;
      }
    }
  }
  return HandType.twoPair;
}

String mostFrequent(List<String> list) {
  Map<String, int> occurrences = {};

  for (var l in list) {
    occurrences[l] = occurrences.containsKey(l) ? occurrences[l]! + 1 : 1;
  }

  return list.fold(list[0], (p, c) => occurrences[c]! > occurrences[p]! ? c : p);
}
