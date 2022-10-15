import 'definitions.dart';

class Scanner {
  final String _sourceCode;
  int _currentIndex = 0;
  late final int _maxSourceCodeLength;
  final _identifierAndKeywordRegExp = RegExp('[A-Za-z_]');
  final _allNumbersRegExp = RegExp('[0-9+-.]');
  final _floatNumberRegExp = RegExp(r'^[+-]?([0-9]+([.][0-9]+)+|[.][0-9]+)$');
  final _stringRegExp = RegExp('[\"\']');

  Scanner(this._sourceCode) {
    _maxSourceCodeLength = _sourceCode.length - 1;
  }

  String get _currentCharacter => _sourceCode[_currentIndex];

  String? get _nextCharacter {
    if (_nextCharacterOutOfRange) return null;
    return _sourceCode[_currentIndex + 1];
  }

  bool get _isEOF => _currentIndex == -1 || _currentIndex == _maxSourceCodeLength;

  bool get _nextCharacterOutOfRange => _currentIndex + 1 > _maxSourceCodeLength;

  void incrementCurrentIndex([int? quantityToIncrement]) =>
      quantityToIncrement == null ? _currentIndex++ : _currentIndex += quantityToIncrement;

  void _setCurrentIndexToEOF() => _currentIndex = -1;

  Token? get nextToken {
    late final Token token;

    if (_isEOF) {
      _setCurrentIndexToEOF();
      return const EndOfFileKeyword();
    }

    if (_currentCharacter == ' ' || _currentCharacter == '\n' || _currentCharacter == '\t') incrementCurrentIndex();

    if (_currentCharacter == '(') {
      incrementCurrentIndex();
      return const OpenParenthesisSeparator();
    }

    if (_currentCharacter == ')') {
      incrementCurrentIndex();
      return const CloseParenthesisSeparator();
    }

    if (_currentCharacter == '{') {
      incrementCurrentIndex();
      return const OpenCurlyBraceSeparator();
    }

    if (_currentCharacter == '}') {
      incrementCurrentIndex();
      return const CloseCurlyBraceSeparator();
    }

    if (_currentCharacter == '[') {
      incrementCurrentIndex();
      return const OpenSquareBracketSeparator();
    }

    if (_currentCharacter == '[') {
      incrementCurrentIndex();
      return const CloseSquareBracketSeparator();
    }

    if (_currentCharacter == ';') {
      incrementCurrentIndex();
      return const SemicolonSeparator();
    }

    if (_currentCharacter == ',') {
      incrementCurrentIndex();
      return const CommaSeparator();
    }

    if (_currentCharacter == '+') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '+') {
        incrementCurrentIndex(2);
        return const IncrementOperator();
      }

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const AdditionAssignmentOperator();
      }

      incrementCurrentIndex();
      return const AdditionOperator();
    }

    if (_currentCharacter == '-') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '-') {
        incrementCurrentIndex(2);
        return const DecrementOperator();
      }

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const SubtractionAssignmentOperator();
      }

      incrementCurrentIndex();
      return const SubtractionOperator();
    }

    if (_currentCharacter == '*') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const MultiplicationAssignmentOperator();
      }

      incrementCurrentIndex();
      return const MultiplicationOperator();
    }

    if (_currentCharacter == '/') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const DivisionAssignmentOperator();
      }

      incrementCurrentIndex();
      return const DivisionOperator();
    }

    if (_currentCharacter == '<') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const LessOrEqualThanOperator();
      }

      incrementCurrentIndex();
      return const LessThanOperator();
    }

    if (_currentCharacter == '>') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const GreaterOrEqualThanOperator();
      }

      incrementCurrentIndex();
      return const GreaterThanOperator();
    }

    if (_currentCharacter == '=') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '==') {
        incrementCurrentIndex(2);
        return const EqualOperator();
      }

      incrementCurrentIndex();
      return const AssignmentOperator();
    }

    if (_currentCharacter == '!') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        incrementCurrentIndex(2);
        return const NotEqualOperator();
      }

      incrementCurrentIndex();
      return const NotOperator();
    }

    if (_currentCharacter == '|') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '|') {
        incrementCurrentIndex(2);
        return const OrOperator();
      }

      incrementCurrentIndex();
      return const BitwiseOrOperator();
    }

    if (_currentCharacter == '&') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '&') {
        incrementCurrentIndex(2);
        return const AndOperator();
      }

      incrementCurrentIndex();
      return const BitwiseAndOperator();
    }

    if (_identifierAndKeywordRegExp.hasMatch(_currentCharacter)) {
      final expressionBuffer = StringBuffer();

      while (_identifierAndKeywordRegExp.hasMatch(_currentCharacter)) {
        expressionBuffer.write(_currentCharacter);
        incrementCurrentIndex();
      }

      final expression = expressionBuffer.toString();

      switch (expression) {
        case 'int':
          return const IntKeyword();
        case 'float':
          return const FloatKeyword();
        case 'char':
          return const CharKeyword();
        case 'void':
          return const VoidKeyword();
        case 'null':
          return const NullLiteral();
        case 'return':
          return const ReturnKeyword();
        case 'if':
          return const IfKeyword();
        case 'else':
          return const ElseKeyword();
        case 'for':
          return const ForKeyword();
        case 'while':
          return const WhileKeyword();
        default:
          return UserDefinedIdentifier(expression);
      }
    }

    if (_allNumbersRegExp.hasMatch(_currentCharacter)) {
      final expressionBuffer = StringBuffer();

      while (_allNumbersRegExp.hasMatch(_currentCharacter)) {
        expressionBuffer.write(_currentCharacter);
        incrementCurrentIndex();
      }

      final expression = expressionBuffer.toString();

      if (_floatNumberRegExp.hasMatch(expression)) {
        return FloatLiteral(expression);
      } else {
        return IntLiteral(expression);
      }
    }

    if (_stringRegExp.hasMatch(_currentCharacter)) {}

    return null;
  }
}
