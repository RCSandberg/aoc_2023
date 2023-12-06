import 'package:aoc_2023/day_06.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 6 a test', () async {
    expect(await day6A('test/data/input_06_test.txt', true), equals(288));
  });
  test('day 6 a', () async {
    expect(await day6A('test/data/input_06.txt', false), equals(293046));
  });
  test('day 6 b test', () async {
    expect(await day6B('test/data/input_06_test.txt', true), equals(71503));
  });
  test('day 6 b', () async {
    expect(await day6B('test/data/input_06.txt', false), equals(35150181));
  });
}
