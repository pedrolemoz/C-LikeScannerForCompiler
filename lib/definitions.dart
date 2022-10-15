class Token {
  final String value;

  Token(this.value);

  @override
  String toString() => '<${this.runtimeType}, $value>';
}

class Identifier extends Token {
  Identifier(super.value);
}

class Keyword extends Token {
  Keyword(super.value);
}

class Separator extends Token {
  Separator(super.value);
}

class Operator extends Token {
  Operator(super.value);
}

class Literal extends Token {
  Literal(super.value);
}

// Identifiers

class UserDefinedIdentifier extends Identifier {
  UserDefinedIdentifier(super.value);
}

// Keywords

class EndOfFileKeyword extends Keyword {
  EndOfFileKeyword(super.value);
}

class ForKeyword extends Keyword {
  ForKeyword(super.value);
}

class WhileKeyword extends Keyword {
  WhileKeyword(super.value);
}

class IfKeyword extends Keyword {
  IfKeyword(super.value);
}

class ElseKeyword extends Keyword {
  ElseKeyword(super.value);
}

class ReturnKeyword extends Keyword {
  ReturnKeyword(super.value);
}

class IntKeyword extends Keyword {
  IntKeyword(super.value);
}

class FloatKeyword extends Keyword {
  FloatKeyword(super.value);
}

class CharKeyword extends Keyword {
  CharKeyword(super.value);
}

class VoidKeyword extends Keyword {
  VoidKeyword(super.value);
}

// Literals

class IntLiteral extends Literal {
  IntLiteral(super.value);
}

class FloatLiteral extends Literal {
  FloatLiteral(super.value);
}

class CharLiteral extends Literal {
  CharLiteral(super.value);
}

class NullLiteral extends Literal {
  NullLiteral(super.value);
}

// Separators

class OpenParenthesisSeparator extends Separator {
  OpenParenthesisSeparator(super.value);
}

class CloseParenthesisSeparator extends Separator {
  CloseParenthesisSeparator(super.value);
}

class OpenCurlyBraceSeparator extends Separator {
  OpenCurlyBraceSeparator(super.value);
}

class CloseCurlyBraceSeparator extends Separator {
  CloseCurlyBraceSeparator(super.value);
}

class OpenSquareBracketSeparator extends Separator {
  OpenSquareBracketSeparator(super.value);
}

class CloseSquareBracketSeparator extends Separator {
  CloseSquareBracketSeparator(super.value);
}

class SemicolonSeparator extends Separator {
  SemicolonSeparator(super.value);
}

class CommaSeparator extends Separator {
  CommaSeparator(super.value);
}

// Operators

class AssignmentOperator extends Operator {
  AssignmentOperator(super.value);
}

class AdditionOperator extends Operator {
  AdditionOperator(super.value);
}

class AdditionAssignmentOperator extends Operator {
  AdditionAssignmentOperator(super.value);
}

class IncrementOperator extends Operator {
  IncrementOperator(super.value);
}

class SubtractionOperator extends Operator {
  SubtractionOperator(super.value);
}

class SubtractionAssignmentOperator extends Operator {
  SubtractionAssignmentOperator(super.value);
}

class DecrementOperator extends Operator {
  DecrementOperator(super.value);
}

class MultiplicationOperator extends Operator {
  MultiplicationOperator(super.value);
}

class MultiplicationAssignmentOperator extends Operator {
  MultiplicationAssignmentOperator(super.value);
}

class DivisionOperator extends Operator {
  DivisionOperator(super.value);
}

class DivisionAssignmentOperator extends Operator {
  DivisionAssignmentOperator(super.value);
}

class LessThanOperator extends Operator {
  LessThanOperator(super.value);
}

class LessOrEqualThanOperator extends Operator {
  LessOrEqualThanOperator(super.value);
}

class GreaterThanOperator extends Operator {
  GreaterThanOperator(super.value);
}

class GreaterOrEqualThanOperator extends Operator {
  GreaterOrEqualThanOperator(super.value);
}

class EqualOperator extends Operator {
  EqualOperator(super.value);
}

class NotEqualOperator extends Operator {
  NotEqualOperator(super.value);
}

class AndOperator extends Operator {
  AndOperator(super.value);
}

class OrOperator extends Operator {
  OrOperator(super.value);
}

class NotOperator extends Operator {
  NotOperator(super.value);
}

class BitwiseAndOperator extends Operator {
  BitwiseAndOperator(super.value);
}

class BitwiseOrOperator extends Operator {
  BitwiseOrOperator(super.value);
}
