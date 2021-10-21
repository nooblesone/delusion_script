import 'package:delusion_script/src/model/statements_model.dart';

import '../../split_extract.dart';
import '../../transcoding.dart';

/// 解析角色资源注册语句
/// $register-role={
///     id-人物1id,
///     name-人物姓名1,
///     files-[
///         差分1id-人物1表情1.png
///         差分2id-人物1表情2.png
///         差分3id-人物1表情3.png
///         差分4id-人物1表情4.png
///         差分5id-人物1表情5.png
///         差分6id-人物1表情6.png
///     ],
/// }
parsingRegisterRoleStatements(String dw, List<Statements> retStatementsList) {
  // 花括号里的语句，已用逗号分隔
  List<String> statementsList = cuttingFromComma(getCurlyBraces(dw));
  var roleId = decodeDwEscape(cuttingFromMinus(statementsList[0])[1]);
  var roleName = decodeDwEscape(cuttingFromMinus(statementsList[1])[1]);
  Map<String, String> files = {};
  List<String> filesList =
      getSquareBrackets(statementsList[2]).trim().split('\n');
  for (var elem in filesList) {
    // 切分之前去除缩进空格
    var elemList = cuttingFromMinus(elem.trimLeft());
    files[decodeDwEscape(elemList[0])] = decodeDwEscape(elem[1]);
  }
  retStatementsList.add(RegisterRoleStatements(
    roleId: roleId,
    name: roleName,
    files: files,
  ));
}

/// 解析 CG 资源注册语句
/// $register-cg={
///     id-CG1id,
///     files-[
///         差分1id-CG差分1.png
///         差分2id-CG差分2.png
///         差分3id-CG差分3.png
///         差分4id-CG差分4.png
///     ],
/// }
parsingRegisterCgStatements(String dw, List<Statements> retStatementsList) {
  // 花括号里的语句，已用逗号分隔
  List<String> statementsList = cuttingFromComma(getCurlyBraces(dw));
  var cgId = decodeDwEscape(cuttingFromMinus(statementsList[0])[1]);
  Map<String, String> files = {};
  List<String> filesList =
      getSquareBrackets(statementsList[1]).trim().split('\n');
  for (var elem in filesList) {
    // 切分之前去除缩进空格
    var elemList = cuttingFromMinus(elem.trimLeft());
    files[decodeDwEscape(elemList[0])] = decodeDwEscape(elem[1]);
  }
  retStatementsList.add(RegisterCgStatements(cgId: cgId, files: files));
}
