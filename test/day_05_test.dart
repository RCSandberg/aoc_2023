import 'package:aoc_2023/day_05.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 5 a test', () async {
    expect(await day5A('test/data/input_05_test.txt', true), equals(35));
  });
  test('day 5 a', () async {
    expect(await day5A('test/data/input_05.txt', false), equals(323142486));
  });
  test('day 5 b test', () async {
    expect(await day5B('test/data/input_05_test.txt', true), equals(46));
  });
  test('day 5 b', () async {
    expect(await day5B('test/data/input_05.txt', false), equals(79874951));
  });
}
