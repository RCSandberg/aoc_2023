import 'package:aoc_2023/day_03.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 3 a test', () async {
    expect(await day3A('test/data/input_03_test.txt'), equals(4361));
  });
  test('day 3 a', () async {
    expect(await day3A('test/data/input_03.txt'), equals(526404));
  });
  test('day 3 b test', () async {
    expect(await day3B('test/data/input_03_test.txt'), equals(467835));
  });
  test('day 3 b', () async {
    expect(await day3B('test/data/input_03.txt'), equals(84399773));
  });
}
