# Scanner for a C-like language

This is a "handwritten" Scanner for a C-like language, to be used as a part of a Compiler.
The scanner processes the input by demand, which means that a parser can control it.

## Definitions

This scanner recognizes identifiers, keywords, separators, operators, literals and comments.

### Identifiers

- User defined identifiers (variables and function names)

### Keywords

- EOF (end of file)
- for
- while
- if
- else
- return
- break
- continue
- int
- float
- char
- void

### Separators

- (
- )
- {
- }
- [
- ]
- ;
- ,

### Operators

- =
- \+
- \+=
- \+\+
- \-
- \-=
- \-\-
- \*
- *=
- /
- /=
- <
- <=
- \>
- \>=
- ==
- !=
- &&
- ||
- !
- &
- |

### Literals

- int
- float
- char
- null

## Usage

I didn't created an executable file to this project, and you need to install Dart SDK in order to use it.

When Dart is properly installed in your system, execute the following command:

```bash
dart main.dart your_source_code.c
```

## Expected output

Take the following code as an example:

```c
int main() {
  // Simple comment
  char p = "p";
  int a = 10;
  float b = 45.5;
  int c;

  for (int i = 0; i <= 10; i++) {
    if (i + a <= 15) {
      c = i;
    }
  }

  a++;
  b -= a;
  c--;

  int d = c / 1;
  d *= 213;

  while (1) {
    break;
  }

  return 0;
}

int sum(int x, int y) { return x + y; }
```

The output for this code is:

```
int => IntKeyword
main => UserDefinedIdentifier
( => OpenParenthesisSeparator
) => CloseParenthesisSeparator
{ => OpenCurlyBraceSeparator
 Simple comment => Comment
char => CharKeyword
p => UserDefinedIdentifier
= => AssignmentOperator
p => CharLiteral
; => SemicolonSeparator
int => IntKeyword
a => UserDefinedIdentifier
= => AssignmentOperator
10 => IntLiteral
; => SemicolonSeparator
float => FloatKeyword
b => UserDefinedIdentifier
= => AssignmentOperator
45.5 => FloatLiteral
; => SemicolonSeparator
int => IntKeyword
c => UserDefinedIdentifier
; => SemicolonSeparator
for => ForKeyword
( => OpenParenthesisSeparator
int => IntKeyword
i => UserDefinedIdentifier
= => AssignmentOperator
0 => IntLiteral
; => SemicolonSeparator
i => UserDefinedIdentifier
<= => LessOrEqualThanOperator
10 => IntLiteral
; => SemicolonSeparator
i => UserDefinedIdentifier
++ => IncrementOperator
) => CloseParenthesisSeparator
{ => OpenCurlyBraceSeparator
if => IfKeyword
( => OpenParenthesisSeparator
i => UserDefinedIdentifier
+ => AdditionOperator
a => UserDefinedIdentifier
<= => LessOrEqualThanOperator
15 => IntLiteral
) => CloseParenthesisSeparator
{ => OpenCurlyBraceSeparator
c => UserDefinedIdentifier
= => AssignmentOperator
i => UserDefinedIdentifier
; => SemicolonSeparator
} => CloseCurlyBraceSeparator
} => CloseCurlyBraceSeparator
a => UserDefinedIdentifier
++ => IncrementOperator
; => SemicolonSeparator
b => UserDefinedIdentifier
-= => SubtractionAssignmentOperator
a => UserDefinedIdentifier
; => SemicolonSeparator
c => UserDefinedIdentifier
-- => DecrementOperator
; => SemicolonSeparator
int => IntKeyword
d => UserDefinedIdentifier
= => AssignmentOperator
c => UserDefinedIdentifier
/ => DivisionOperator
1 => IntLiteral
; => SemicolonSeparator
d => UserDefinedIdentifier
*= => MultiplicationAssignmentOperator
213 => IntLiteral
; => SemicolonSeparator
while => WhileKeyword
( => OpenParenthesisSeparator
1 => IntLiteral
) => CloseParenthesisSeparator
{ => OpenCurlyBraceSeparator
break => BreakKeyword
; => SemicolonSeparator
} => CloseCurlyBraceSeparator
return => ReturnKeyword
0 => IntLiteral
; => SemicolonSeparator
} => CloseCurlyBraceSeparator
int => IntKeyword
sum => UserDefinedIdentifier
( => OpenParenthesisSeparator
int => IntKeyword
x => UserDefinedIdentifier
, => CommaSeparator
int => IntKeyword
y => UserDefinedIdentifier
) => CloseParenthesisSeparator
{ => OpenCurlyBraceSeparator
return => ReturnKeyword
x => UserDefinedIdentifier
+ => AdditionOperator
y => UserDefinedIdentifier
; => SemicolonSeparator
} => CloseCurlyBraceSeparator
EOF => EndOfFileKeyword
```