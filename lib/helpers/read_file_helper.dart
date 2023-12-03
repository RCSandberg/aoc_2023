import 'dart:io';

Future<List<String>> readFileAsLines(String filename) {
  return File(filename).readAsLines();
}

Future<String> readFileAsString(String filename) {
  return File(filename).readAsString();
}
