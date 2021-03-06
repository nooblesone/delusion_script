String dwConfigFile = r'''
$register-role={
    id-人物1id,
    name-人物姓名1,
    files-[
        差分1id-人物1表情1.png
        差分2id-人物1表情2.png
        差分3id-人物1表情3.png
        差分4id-人物1表情4.png
        差分5id-人物1表情5.png
        差分6id-人物1表情6.png
    ],
};
$register-cg={
    id-CG1id,
    files-[
        差分1id-CG差分1.png
        差分2id-CG差分2.png
        差分3id-CG差分3.png
        差分4id-CG差分4.png
    ],
};
''';
String dwFile = r'''
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
