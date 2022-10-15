import 'definitions.dart';
import 'scanner.dart';

const code = '''
int main() {
    int a = 10;
    floab b = 45.5;
    int c;
    for (int i = 0; i <= 10; i++) {
        if (i + a <= 15) {
            c = i;
        }
    }
    return 0;
}
''';

void main() {
  final scanner = Scanner(code);

  while (true) {
    final token = scanner.nextToken;
    if (token is EndOfFileKeyword) break;
    if (token != null) print(token);
  }
}
