import 'package:aoc_2023/day_01.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 1 a test', () async {
    expect(await day1A('test/data/input_01_test.txt'), equals(142));
  });
  test('day 1 a', () async {
    expect(await day1A('test/data/input_01.txt'), equals(55090));
  });
  test('day 1 b test', () async {
    expect(await day1B('test/data/input_01_b_test.txt'), equals(281));
  });
  test('day 1 b', () async {
    expect(await day1B('test/data/input_01.txt'), equals(54845));
  });
}
