import 'package:aoc_2023/day_02.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 2 a test', () async {
    expect(await day2A('test/data/input_02_test.txt'), equals(8));
  });
  test('day 2 a', () async {
    expect(await day2A('test/data/input_02.txt'), equals(2486));
  });
  test('day 2 b test', () async {
    expect(await day2B('test/data/input_02_test.txt'), equals(2286));
  });
  test('day 2 b', () async {
    expect(await day2B('test/data/input_02.txt'), equals(87984));
  });
}
