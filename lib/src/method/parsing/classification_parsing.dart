import 'package:delusion_script/src/config/config.dart';
import 'package:delusion_script/src/model/statements_model.dart';

import '../split_extract.dart';
import '../transcoding.dart';
import 'config/config_parsing.dart';
import 'control/control_parsing.dart';
import 'dialogue/dialogue_parsing.dart';
import 'jump/jump_parsing.dart';

/// 第一层的语句解析，
List<Statements> parsingWx({required String dw}) {
  List<Statements> retStatementsList = [];

  String encodeOver = encodeDwEscape(dw);

  List<String> dwList = cuttingFromSemicolon(encodeOver);

  for (var elem in dwList) {
    // 去除缩进空格
    elem = elem.trimLeft();

    if (elem.startsWith('@')) {
      parsingControlStatements(elem, retStatementsList);
    } // 是否以 @ 开头，识别控制语句
    else if (elem.startsWith(r'$')) {
      parsingConfigStatements(elem, retStatementsList);
    } // 识别配置语句
    else if (elem.startsWith('#')) {
      parsingJumpStatements(elem, retStatementsList);
      break; // 识别到跳转语句后会离开循环
    } // 识别跳转语句
    else {
      parsingDialogueStatements(elem, retStatementsList);
    } // 识别对话语句
  }
  return retStatementsList;
}

/// 跳转语句解析，第二层区分
parsingJumpStatements(String dw, List<Statements> retStatementsList) {
  if (dw.startsWith(branchJumpStatements)) {
    parsingBranchJumpStatements(dw, retStatementsList);
  } else if (dw.startsWith(fileJumpStatements)) {
    parsingFileJumpStatements(dw, retStatementsList);
  }
}

/// 配置语句解析，第二层区分
parsingConfigStatements(String dw, List<Statements> retStatementsList) {
  if (dw.startsWith(registerRole)) {
    parsingRegisterRoleStatements(dw, retStatementsList);
  } // 识别并解析角色资源注册语句
  else if (dw.startsWith(registerCg)) {
    parsingRegisterCgStatements(dw, retStatementsList);
  } // 识别并解析 CG 资源注册语句
}

/// 控制语句解析,做第二层区分
parsingControlStatements(String dw, List<Statements> retStatementsList) {
  if (dw.startsWith(bgmStatements)) {
    parsingBgmStatements(dw, retStatementsList);
  } // 识别并解析背景音乐语句
  else if (dw.startsWith(backgroundStatements)) {
    parsingBackgroundImgStatements(dw, retStatementsList);
  } // 识别并解析背景图片语句
  else if (dw.startsWith(entranceStatements)) {
    parsingEntranceStatements(dw, retStatementsList);
  } // 识别并解析入场语句
  else if (dw.startsWith(effectStatements)) {
    parsingEffectStatements(dw, retStatementsList);
  } // 识别并解析效果音语句
  else if (dw.startsWith(leaveStatements)) {
    parsingLeaveStatements(dw, retStatementsList);
  } // 识别并解析离场语句
  else if (dw.startsWith(cgShowStatements)) {
    parsingCgShowStatements(dw, retStatementsList);
  } // 识别并解析 cg 演出语句
  else if (dw.startsWith(cgHideStatements)) {
    parsingCgHideStatements(dw, retStatementsList);
  }
}
