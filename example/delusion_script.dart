import 'package:delusion_script/delusion_script.dart' as dwParsing;
import 'package:delusion_script/delusion_script.dart';

void main() async {
  List<Statements> statementsList = dwParsing.parsingDwStatements(dw);
}

String dw = r'''
@background-背景1.png;
@bgm-start-背景音乐.mp3;
@entrance-人物1id-差分2id-location;
人物姓名1-对话1-对话音频1.ogg-效果音1.ogg;
人物姓名2-对话2-对话音频2.ogg-效果音2.ogg;
人物姓名3-对话3-对话音频3.ogg-效果音3.ogg;
人物姓名1-对话4-对话音频4.ogg-效果音4.ogg;
@leave-人物1id-差分2id-location;
@effect-效果音5.ogg;
人物姓名2-对话5-对话音频5.ogg;
人物姓名3-对话6-对话音频6.ogg;
@cg-show-CGid1-差分1id;
@cg-show-CGid1-差分2id;
\/-旁白1;
人物姓名2-对话7-对话音频7.ogg;
@effect-效果音2.ogg;
@cg-hide-CGid1;
人物姓名1-{
    对话8-对话音频8.ogg,
    对话9-对话音频9.ogg-效果音5.ogg,
    对话10-对话音10.ogg,
};
#branch-{
    分支选项1-分支1.dw,
    分支选项2-分支2.dw,
};
@bgm-stop-背景音乐.mp3;
#jump-文件.dw;
''';