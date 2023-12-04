import 'package:aoc_2023/day_04.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('day 4 a test', () async {
    expect(await day4A('test/data/input_04_test.txt'), equals(13));
  });
  test('day 4 a', () async {
    expect(await day4A('test/data/input_04.txt'), equals(19135));
  });
  test('day 4 b test', () async {
    expect(await day4B('test/data/input_04_test.txt'), equals(30));
  });
  test('day 4 b', () async {
    expect(await day4B('test/data/input_04.txt'), equals(5704953));
  });
}
