import 'package:delusion_script/src/config/config.dart';
import 'package:delusion_script/src/model/statements_model.dart';

import '../../split_extract.dart';
import '../../transcoding.dart';

/// 解析 BGM 语句
/// @bgm-start-背景音乐.mp3
/// @bgm-stop-背景音乐.mp3
parsingBgmStatements(String dw, List<Statements> retStatementsList) {
  bool _play = false;
  if (dw.startsWith(bgmStartStatements)) {
    _play = true;
  }
  var statementsList = cuttingFromMinus(dw);
  var musicFileName = statementsList[2];
  retStatementsList.add(BackgroundMusicStatements(
    play: _play,
    musicFileName: musicFileName,
  ));
}

/// 解析背景图片语句
/// @background-背景1.png
parsingBackgroundImgStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromMinus(dw);
  decodeDwListEscape(statementsList);
  var backgroundFileName = statementsList[1];
  retStatementsList
      .add(BackgroundStatements(backgroundFileName: backgroundFileName));
}

/// 解析音效语句
/// @effect-效果音5.ogg;
parsingEffectStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromMinus(dw);
  decodeDwListEscape(statementsList);
  var effectSoundFileName = statementsList[1];
  retStatementsList
      .add(EffectSoundStatements(effectSoundFileName: effectSoundFileName));
}

/// 解析人物入场语句
/// @leave-人物1id-差分2id-location
parsingEntranceStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromMinus(dw);
  decodeDwListEscape(statementsList);
  var roleId = decodeDwEscape(statementsList[1]);
  var expressionId = statementsList[2];
  var location = statementsList[3];
  retStatementsList.add(EntranceStatements(
      roleId: roleId, expressionId: expressionId, location: location));
}

/// 解析人物离场语句
/// @leave-人物1id
parsingLeaveStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromMinus(dw);
  decodeDwListEscape(statementsList);
  var roleId = statementsList[1];
  retStatementsList.add(LeaveStatements(roleId: roleId));
}

/// 解析 CG 演出语句
/// @cg-show-CGid1-差分1id
parsingCgShowStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromMinus(dw);
  decodeDwListEscape(statementsList);
  var cgId = statementsList[2];
  var cgChildId = statementsList[3];
  retStatementsList.add(CgShowStatements(cgId: cgId, cgChildId: cgChildId));
}

/// 解析 CG 隐藏语句
/// @cg-hide-CGid1
parsingCgHideStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromMinus(dw);
  decodeDwListEscape(statementsList);
  var cgId = statementsList[2];
  retStatementsList.add(CgHideStatements(cgId: cgId));
}
