import 'definitions.dart';

class Scanner {
  final String _sourceCode;
  int _currentIndex = 0;
  late final int _maxSourceCodeLength;
  final _identifierAndKeywordRegExp = RegExp('[A-Za-z_]');
  final _allNumbersRegExp = RegExp('[0-9+-.]');
  final _floatNumberRegExp = RegExp(r'^[+-]?([0-9]+([.][0-9]+)+|[.][0-9]+)$');

  Scanner(this._sourceCode) {
    _setSourceCodeMaxLength();
  }

  void _setSourceCodeMaxLength() => _maxSourceCodeLength = _sourceCode.length;

  String get _currentCharacter => _sourceCode[_currentIndex];

  String? get _nextCharacter {
    if (_nextCharacterOutOfRange) return null;
    return _sourceCode[_currentIndex + 1];
  }

  bool get _isEOF => _currentIndex == -1 || _currentIndex == _maxSourceCodeLength;

  bool get _nextCharacterOutOfRange => _currentIndex + 1 > _maxSourceCodeLength;

  void _incrementCurrentIndex([int? quantityToIncrement]) => _currentIndex += quantityToIncrement ?? 1;

  void _setCurrentIndexToEOF() => _currentIndex = -1;

  Token get nextToken {
    if (_isEOF) {
      _setCurrentIndexToEOF();
      return const EndOfFileKeyword();
    }

    while (_currentCharacter == ' ' || _currentCharacter == '\n' || _currentCharacter == '\t') {
      _incrementCurrentIndex();
    }

    if (_currentCharacter == '(') {
      _incrementCurrentIndex();
      return const OpenParenthesisSeparator();
    }

    if (_currentCharacter == ')') {
      _incrementCurrentIndex();
      return const CloseParenthesisSeparator();
    }

    if (_currentCharacter == '{') {
      _incrementCurrentIndex();
      return const OpenCurlyBraceSeparator();
    }

    if (_currentCharacter == '}') {
      _incrementCurrentIndex();
      return const CloseCurlyBraceSeparator();
    }

    if (_currentCharacter == '[') {
      _incrementCurrentIndex();
      return const OpenSquareBracketSeparator();
    }

    if (_currentCharacter == '[') {
      _incrementCurrentIndex();
      return const CloseSquareBracketSeparator();
    }

    if (_currentCharacter == ';') {
      _incrementCurrentIndex();
      return const SemicolonSeparator();
    }

    if (_currentCharacter == ',') {
      _incrementCurrentIndex();
      return const CommaSeparator();
    }

    if (_currentCharacter == '+') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '+') {
        _incrementCurrentIndex(2);
        return const IncrementOperator();
      }

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const AdditionAssignmentOperator();
      }

      _incrementCurrentIndex();
      return const AdditionOperator();
    }

    if (_currentCharacter == '-') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '-') {
        _incrementCurrentIndex(2);
        return const DecrementOperator();
      }

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const SubtractionAssignmentOperator();
      }

      _incrementCurrentIndex();
      return const SubtractionOperator();
    }

    if (_currentCharacter == '*') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const MultiplicationAssignmentOperator();
      }

      _incrementCurrentIndex();
      return const MultiplicationOperator();
    }

    if (_currentCharacter == '/') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const DivisionAssignmentOperator();
      }

      _incrementCurrentIndex();
      return const DivisionOperator();
    }

    if (_currentCharacter == '<') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const LessOrEqualThanOperator();
      }

      _incrementCurrentIndex();
      return const LessThanOperator();
    }

    if (_currentCharacter == '>') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const GreaterOrEqualThanOperator();
      }

      _incrementCurrentIndex();
      return const GreaterThanOperator();
    }

    if (_currentCharacter == '=') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '==') {
        _incrementCurrentIndex(2);
        return const EqualOperator();
      }

      _incrementCurrentIndex();
      return const AssignmentOperator();
    }

    if (_currentCharacter == '!') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        _incrementCurrentIndex(2);
        return const NotEqualOperator();
      }

      _incrementCurrentIndex();
      return const NotOperator();
    }

    if (_currentCharacter == '|') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '|') {
        _incrementCurrentIndex(2);
        return const OrOperator();
      }

      _incrementCurrentIndex();
      return const BitwiseOrOperator();
    }

    if (_currentCharacter == '&') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '&') {
        _incrementCurrentIndex(2);
        return const AndOperator();
      }

      _incrementCurrentIndex();
      return const BitwiseAndOperator();
    }

    if (_currentCharacter == '\"') {
      final expressionBuffer = StringBuffer();

      _incrementCurrentIndex();

      while (_currentCharacter != '\"') {
        expressionBuffer.write(_currentCharacter);
        _incrementCurrentIndex();
      }

      final expression = expressionBuffer.toString();

      // Future mapping for string type
      if (expression.length > 1) {
        throw Exception('Invalid char value: $expression');
      } else {
        _incrementCurrentIndex();
        return CharLiteral(expression);
      }
    }

    if (_identifierAndKeywordRegExp.hasMatch(_currentCharacter)) {
      final expressionBuffer = StringBuffer();

      while (_identifierAndKeywordRegExp.hasMatch(_currentCharacter)) {
        expressionBuffer.write(_currentCharacter);
        _incrementCurrentIndex();
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
        case 'break':
          return const BreakKeyword();
        case 'continue':
          return const ContinueKeyword();
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
        _incrementCurrentIndex();
      }

      final expression = expressionBuffer.toString();

      if (_floatNumberRegExp.hasMatch(expression)) {
        return FloatLiteral(expression);
      } else {
        return IntLiteral(expression);
      }
    }

    throw Exception('Invalid expression: $_currentCharacter');
  }
}
