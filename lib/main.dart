import 'package:scanner/definitions.dart';

import 'scanner.dart';

final code = '''
int main() {
    int a = 10;
    int c;
    for (int i = 0; i <= 10; i++) {
        if (i + a <= 15) {
            c = i;
        }
    }
    return 0;
}

void some_fn() {
  return null;
}
''';

void main() {
  print('Tokens:');
  final scanner = Scanner(code);

  while (true) {
    final token = scanner.nextToken;
    if (token is EndOfFileKeyword) break;
    if (token != null) print(token);
  }
}
