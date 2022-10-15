class Token {
  final String value;

  const Token(this.value);

  @override
  String toString() => '$value => $runtimeType';
}

class Identifier extends Token {
  const Identifier(super.value);
}

class Keyword extends Token {
  const Keyword(super.value);
}

class Separator extends Token {
  const Separator(super.value);
}

class Operator extends Token {
  const Operator(super.value);
}

class Literal extends Token {
  const Literal(super.value);
}

class Comment extends Token {
  const Comment(super.value);
}

// Identifiers

class UserDefinedIdentifier extends Identifier {
  const UserDefinedIdentifier(super.value);
}

// Keywords

class EndOfFileKeyword extends Keyword {
  const EndOfFileKeyword() : super('EOF');
}

class ForKeyword extends Keyword {
  const ForKeyword() : super('for');
}

class WhileKeyword extends Keyword {
  const WhileKeyword() : super('while');
}

class IfKeyword extends Keyword {
  const IfKeyword() : super('if');
}

class ElseKeyword extends Keyword {
  const ElseKeyword() : super('else');
}

class ReturnKeyword extends Keyword {
  const ReturnKeyword() : super('return');
}

class BreakKeyword extends Keyword {
  const BreakKeyword() : super('break');
}

class ContinueKeyword extends Keyword {
  const ContinueKeyword() : super('continue');
}

class IntKeyword extends Keyword {
  const IntKeyword() : super('int');
}

class FloatKeyword extends Keyword {
  const FloatKeyword() : super('float');
}

class CharKeyword extends Keyword {
  const CharKeyword() : super('char');
}

class VoidKeyword extends Keyword {
  const VoidKeyword() : super('void');
}

// Literals

class IntLiteral extends Literal {
  const IntLiteral(super.value);
}

class FloatLiteral extends Literal {
  const FloatLiteral(super.value);
}

class CharLiteral extends Literal {
  const CharLiteral(super.value);
}

class NullLiteral extends Literal {
  const NullLiteral() : super('null');
}

// Separators

class OpenParenthesisSeparator extends Separator {
  const OpenParenthesisSeparator() : super('(');
}

class CloseParenthesisSeparator extends Separator {
  const CloseParenthesisSeparator() : super(')');
}

class OpenCurlyBraceSeparator extends Separator {
  const OpenCurlyBraceSeparator() : super('{');
}

class CloseCurlyBraceSeparator extends Separator {
  const CloseCurlyBraceSeparator() : super('}');
}

class OpenSquareBracketSeparator extends Separator {
  const OpenSquareBracketSeparator() : super('[');
}

class CloseSquareBracketSeparator extends Separator {
  const CloseSquareBracketSeparator() : super(']');
}

class SemicolonSeparator extends Separator {
  const SemicolonSeparator() : super(';');
}

class CommaSeparator extends Separator {
  const CommaSeparator() : super(',');
}

// Operators

class AssignmentOperator extends Operator {
  const AssignmentOperator() : super('=');
}

class AdditionOperator extends Operator {
  const AdditionOperator() : super('+');
}

class AdditionAssignmentOperator extends Operator {
  const AdditionAssignmentOperator() : super('+=');
}

class IncrementOperator extends Operator {
  const IncrementOperator() : super('++');
}

class SubtractionOperator extends Operator {
  const SubtractionOperator() : super('-');
}

class SubtractionAssignmentOperator extends Operator {
  const SubtractionAssignmentOperator() : super('-=');
}

class DecrementOperator extends Operator {
  const DecrementOperator() : super('--');
}

class MultiplicationOperator extends Operator {
  const MultiplicationOperator() : super('*');
}

class MultiplicationAssignmentOperator extends Operator {
  const MultiplicationAssignmentOperator() : super('*=');
}

class DivisionOperator extends Operator {
  const DivisionOperator() : super('/');
}

class DivisionAssignmentOperator extends Operator {
  const DivisionAssignmentOperator() : super('/=');
}

class LessThanOperator extends Operator {
  const LessThanOperator() : super('<');
}

class LessOrEqualThanOperator extends Operator {
  const LessOrEqualThanOperator() : super('<=');
}

class GreaterThanOperator extends Operator {
  const GreaterThanOperator() : super('>');
}

class GreaterOrEqualThanOperator extends Operator {
  const GreaterOrEqualThanOperator() : super('>=');
}

class EqualOperator extends Operator {
  const EqualOperator() : super('==');
}

class NotEqualOperator extends Operator {
  const NotEqualOperator() : super('!=');
}

class AndOperator extends Operator {
  const AndOperator() : super('&&');
}

class OrOperator extends Operator {
  const OrOperator() : super('||');
}

class NotOperator extends Operator {
  const NotOperator() : super('!');
}

class BitwiseAndOperator extends Operator {
  const BitwiseAndOperator() : super('&');
}

class BitwiseOrOperator extends Operator {
  const BitwiseOrOperator() : super('|');
}
