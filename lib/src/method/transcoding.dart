/// 用到的转义字符
String semicolon = '_&SEMICOLON&_';
String minus = '_&MINUS&_';
String space = '_&SPACE&_';
String at = '_&AT&_';

/// 转义表
Map<String, String> encodeEscapeTable = {
  r'\;': semicolon,
  r'\-': minus,
  r'\/': space,
  r'\@': at,
};

/// 回转义表
Map<String, String> decodeEscapeTable = {
  semicolon: ';',
  minus: '-',
  space: ' ',
  at: '@',
};

/// 编码
String encodeDwEscape(String dw) {
  return dw
      .replaceAll(r'\/', encodeEscapeTable[r'\/']!)
      .replaceAll(r'\@', encodeEscapeTable[r'\/']!)
      .replaceAll(r'\;', encodeEscapeTable[r'\;']!)
      .replaceAll(r'\-', encodeEscapeTable[r'\-']!);
}

/// 解码
String decodeDwEscape(String dw) {
  return dw
      .replaceAll(semicolon, decodeEscapeTable[semicolon]!)
      .replaceAll(minus, decodeEscapeTable[minus]!)
      .replaceAll(space, decodeEscapeTable[space]!)
      .replaceAll(at, decodeEscapeTable[at]!);
}

/// 将传入的字符串数组解码
decodeDwListEscape(List<String> statementsList) {
  for (int i = 0; i < statementsList.length; i++) {
    statementsList[i] = decodeDwEscape(statementsList[i]);
  }
}
