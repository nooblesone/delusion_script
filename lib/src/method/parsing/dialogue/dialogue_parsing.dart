import 'package:delusion_script/src/model/statements_model.dart';

import '../../split_extract.dart';
import '../../transcoding.dart';

/// 解析对话语句
/// 人物姓名1-对话1-对话音频1.ogg-效果音1.ogg
/// 人物姓名1-对话1-对话音频1.ogg
/// 人物姓名1-对话1
/// 人物姓名1-对话1--效果音1.ogg
/// 人物姓名1-对话1--效果音1.ogg-效果音2.ogg-效果音3.ogg
/// 人物姓名1-{
///     对话8-对话音频8.ogg,
///     对话9-对话音频9.ogg-效果音5.ogg,
///     对话10-对话音10.ogg,
/// }
parsingDialogueStatements(String dw, List<Statements> retStatementsList) {
  if (dw.contains('{') && dw.contains('}')) {
    var name = dw.substring(0, dw.indexOf('-'));
    List<String> statementsList = cuttingFromComma(getCurlyBraces(dw));
    List<DialogueModel> dialogueModelList = [];

    for (var elem in statementsList) {
      elem = elem.trimLeft();
      var elemList = cuttingFromMinus(elem);
      if (elemList.length == 1) {
        dialogueModelList.add(DialogueModel(text: elemList.first));
      } else if (elemList.length == 2) {
        dialogueModelList.add(
            DialogueModel(text: elemList.first, dialogueAudio: elemList.last));
      } else if (elemList.length > 2) {
        dialogueModelList.add(DialogueModel(
            text: elemList.first,
            dialogueAudio: elemList[1],
            effectSound: elemList.skip(2).toList()));
      }
    }
    retStatementsList.add(
        DialogueStatements(name: name, dialogueModelList: dialogueModelList));
  } else {
    List<String> statementsList = cuttingFromMinus(dw);
    decodeDwListEscape(statementsList);
    if (statementsList.length == 2) {
      retStatementsList.add(DialogueStatements(
          name: statementsList.first,
          dialogueModelList: [DialogueModel(text: statementsList.last)]));
    } else if (statementsList.length == 3) {
      retStatementsList.add(DialogueStatements(
          name: statementsList.first,
          dialogueModelList: [
            DialogueModel(
                text: statementsList[1], dialogueAudio: statementsList.last)
          ]));
    } else if (statementsList.length > 3) {
      retStatementsList.add(
          DialogueStatements(name: statementsList.first, dialogueModelList: [
        DialogueModel(
            text: statementsList[1],
            dialogueAudio: statementsList[2],
            effectSound: statementsList.skip(3).toList())
      ]));
    }
  }
}
