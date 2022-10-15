import 'dart:io';

import 'package:path/path.dart';

import 'definitions.dart';
import 'scanner.dart';

void main(List<String> args) {
  if (args.isEmpty) throw Exception('Source file path should be specified');

  final filePath = args.first;
  final sourceFile = File(normalize(filePath));
  final sourceCode = sourceFile.readAsStringSync();

  final scanner = Scanner(sourceCode);

  while (true) {
    final token = scanner.nextToken;
    print(token);
    if (token is EndOfFileKeyword) break;
  }
}
