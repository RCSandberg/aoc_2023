import 'package:aoc_2023/day_07.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 7 a test', () async {
    expect(await day7A('test/data/input_07_test.txt', false), equals(6440));
  });
  test('day 7 a', () async {
    expect(await day7A('test/data/input_07.txt', false), equals(250254244));
  });
  test('day 7 b test', () async {
    expect(await day7B('test/data/input_07_test.txt', true), equals(5905));
  });
  test('day 7 b', () async {
    expect(await day7B('test/data/input_07.txt', true), equals(250087440));
  });

  group("evaluateHandType no joker", () {
    var inToRes = {
      "11111": HandType.five,
      "11211": HandType.four,
      "12121": HandType.full,
      "11123": HandType.three,
      "11223": HandType.twoPair,
      "11234": HandType.pair,
      "12345": HandType.distinct,
    };
    inToRes.forEach(
      (input, res) => test(' $input -> $res', () async {
        expect(evaluateHandType(input, false), equals(res));
      }),
    );
  });

  group("evaluateHandType joker as 1", () {
    var inToRes = {
      "22222": HandType.five,
      "22122": HandType.five,
      "32123": HandType.full,
      "22213": HandType.four,
      "51234": HandType.pair,
      "22145": HandType.three,
    };
    inToRes.forEach(
      (input, res) => test(' $input -> $res', () async {
        expect(evaluateHandType(input, true), equals(res));
      }),
    );
  });
}
