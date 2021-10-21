/// 获取 '{}' 中的语句
String getCurlyBraces(String dw) {
  return dw.substring(dw.indexOf('{') + 1, dw.lastIndexOf('}'));
}

/// 获取 '[]' 中的语句
String getSquareBrackets(String dw) {
  return dw.substring(dw.indexOf('[') + 1, dw.lastIndexOf(']'));
}

/// 根据 ',' 拆分原语句
List<String> cuttingFromComma(String dw) {
  List<String> dwList = dw.split(',');

  if (dwList.last.isEmpty) {
    dwList.removeLast();
  } else if (dwList.last.endsWith(',')) {
    dwList.last.replaceFirst(',', '');
  }
  return dwList;
}

/// 根据 ';' 拆分原语句
List<String> cuttingFromSemicolon(String dw) {
  List<String> dwList = dw.split(';');

  if (dwList.last.isEmpty) {
    dwList.removeLast();
  } else if (dwList.last.endsWith(';')) {
    dwList.last.replaceFirst(';', '');
  }
  return dwList;
}

/// 根据 ''' 拆分原语句

/// 根据 '-' 拆分原语句
List<String> cuttingFromMinus(String dw) {
  return dw.split('-');
}
