import 'definitions.dart';
import 'scanner.dart';

const code = '''
int main() {
    char p = "p";
    int a = 10;
    float b = 45.5;
    int c;
    for (int i = 0; i <= 10; i++) {
        if (i + a <= 15) {
            c = i;
        }
    }
    while (1) {break;}
    return 0;
}
''';

void main() {
  final scanner = Scanner(code);

  while (true) {
    final token = scanner.nextToken;
    print(token);
    if (token is EndOfFileKeyword) break;
  }
}
