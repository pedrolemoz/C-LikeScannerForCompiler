import 'definitions.dart';

class Scanner {
  final String _sourceCode;
  int _currentIndex = 0;
  late final int _maxSourceCodeLength;
  final _identifierAndKeywordRegExp = RegExp('[A-Za-z_]');
  final _numberRegExp = RegExp('[0-9.]');
  final _stringRegExp = RegExp('[\"\']');
  List<Token> _tokens = [];
  List<Token> get tokens => _tokens.toList();

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
      return EndOfFileKeyword('EOF');
    }

    if (_currentCharacter == ' ' || _currentCharacter == '\n' || _currentCharacter == '\t') incrementCurrentIndex();

    if (_currentCharacter == '(') {
      token = OpenParenthesisSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == ')') {
      token = CloseParenthesisSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '{') {
      token = OpenCurlyBraceSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '}') {
      token = CloseCurlyBraceSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '[') {
      token = OpenSquareBracketSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '[') {
      token = CloseSquareBracketSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == ';') {
      token = SemicolonSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == ',') {
      token = CommaSeparator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '+') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '+') {
        token = IncrementOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      if (nextCharacter != null && nextCharacter == '=') {
        token = AdditionAssignmentOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = AdditionOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '-') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '-') {
        token = DecrementOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      if (nextCharacter != null && nextCharacter == '=') {
        token = SubtractionAssignmentOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = SubtractionOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '*') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        token = MultiplicationAssignmentOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = MultiplicationOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '/') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        token = DivisionAssignmentOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = DivisionOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '<') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        token = LessOrEqualThanOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = LessThanOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '>') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        token = GreaterOrEqualThanOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = GreaterThanOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '=') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '==') {
        token = EqualOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = AssignmentOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '!') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '=') {
        token = NotEqualOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = NotOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '|') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '|') {
        token = OrOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = BitwiseOrOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
    }

    if (_currentCharacter == '&') {
      final nextCharacter = _nextCharacter;

      if (nextCharacter != null && nextCharacter == '&') {
        token = AndOperator('$_currentCharacter$nextCharacter');
        incrementCurrentIndex(2);
        return token;
      }

      token = BitwiseAndOperator(_currentCharacter);
      incrementCurrentIndex();
      return token;
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
          return IntKeyword(expression);
        case 'float':
          return FloatKeyword(expression);
        case 'char':
          return CharKeyword(expression);
        case 'void':
          return VoidKeyword(expression);
        case 'null':
          return NullLiteral(expression);
        case 'return':
          return ReturnKeyword(expression);
        case 'if':
          return IfKeyword(expression);
        case 'else':
          return ElseKeyword(expression);
        case 'for':
          return ForKeyword(expression);
        case 'while':
          return WhileKeyword(expression);
        default:
          return UserDefinedIdentifier(expression);
      }
    }

    if (_numberRegExp.hasMatch(_currentCharacter)) {
      final expressionBuffer = StringBuffer();

      while (_numberRegExp.hasMatch(_currentCharacter)) {
        expressionBuffer.write(_currentCharacter);
        incrementCurrentIndex();
      }

      final expression = expressionBuffer.toString();

      if (expression.contains('.')) {
        return FloatLiteral(expression);
      } else {
        return IntLiteral(expression);
      }
    }

    if (_stringRegExp.hasMatch(_currentCharacter)) {}
  }
}
