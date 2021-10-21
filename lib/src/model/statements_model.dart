/// 语句模型的父抽象类
abstract class Statements {}

///对话语句{
/// 	人物姓名;
/// 	人物台词<List<台词模型>>;
/// }
class DialogueStatements implements Statements {
  late String _name;
  late List<DialogueModel> _dialogueModelList;

  DialogueStatements(
      {required String name, required List<DialogueModel> dialogueModelList}) {
    _name = name;
    _dialogueModelList = dialogueModelList;
  }

  List<DialogueModel> get dialogueModelList => _dialogueModelList;

  String get characterName => _name;
}

/// 台词模型{
///	  台词;
/// 	语音音频;
/// 	效果音频;
/// }
class DialogueModel {
  DialogueModel(
      {required String text,
        String? dialogueAudio,
        List<String>? effectSound}) {
    _text = text;
    _dialogueAudio = dialogueAudio;
    _effectSound = effectSound;
  }

  late String _text;
  String? _dialogueAudio;
  List<String>? _effectSound;

  String get text => _text;

  String? get dialogueAudio => _dialogueAudio;

  List<String>? get effectSound => _effectSound;
}

/// BGM不主动停止或切换的话会循环播放
/// BGM播放/切换语句{
///   背景音乐文件名;
/// }
class BackgroundMusicStatements implements Statements {
  late bool _play;

  late String _musicFileName;

  BackgroundMusicStatements(
      {required bool play, required String musicFileName}) {
    _musicFileName = musicFileName;
    _play = play;
  }

  String get musicFileName => _musicFileName;

  bool get play => _play;
}

/// 背景图片
/// 背景图片有展示和切换
/// 不需要背景图片需要自备黑幕图片
///
/// 背景图片语句{
///   背景图片文件名;
/// }
class BackgroundStatements implements Statements {
  late String _backgroundFileName;

  BackgroundStatements({required String backgroundFileName}) {
    _backgroundFileName = backgroundFileName;
  }

  String get backgroundFileName => _backgroundFileName;
}

/// 效果音语句会在角色说完话后播放
/// 而对话语句的效果音会在角色开始说话时播放
/// 效果音只会播放一次，播完即停

/// 效果音语句{
///   效果音效文件名称;
/// }
class EffectSoundStatements implements Statements {
  late String _effectSoundFileName;

  EffectSoundStatements({required String effectSoundFileName}) {
    _effectSoundFileName = effectSoundFileName;
  }

  String get effectSoundFileName => _effectSoundFileName;
}

/// 用来控制人物在舞台的显示与消失
/// 如果人物本来就在舞台上，
/// 在舞台上的角色会根据新的入场语句中不同的属性(位置，表情)进行状态的变换
/// 不同的立绘差分都被认为是表情。
///
/// 人物出场/入场语句{
///   人物id;
///   位置信息;
///   表情信息;
/// }

/// 入场语句
class EntranceStatements implements Statements {
  late String _roleId;
  late String _location; //位置信息，没有想好具体的解析先直接保留语句
  late String _expressionId;

  EntranceStatements(
      {required String roleId,
        required String expressionId,
        required String location}) {
    _roleId = roleId;
    _location = location;
    _expressionId = expressionId;
  }

  String get expression => _expressionId;

  String get location => _location;

  String get roleId => _roleId;
}

/// 离场语句
class LeaveStatements implements Statements {
  late String _roleId;

  LeaveStatements({required String roleId}) {
    _roleId = roleId;
  }

  String get roleId => _roleId;
}

/// CG演出需要注册CG资源
/// CG演出后会进行记录，主要用于CG解锁功能
/// 演出CG时,CG会覆盖舞台，在停止演出后消失
///
/// CG show 语句{
///   CGid;
///   CG差分id;
/// }

/// CG 展示
class CgShowStatements implements Statements {
  late String _cgId;
  late String _cgChildId;

  CgShowStatements({required String cgId, required String cgChildId}) {
    _cgId = cgId;
    _cgChildId = cgChildId;
  }

  String get cgChildId => _cgChildId;

  String get cgId => _cgId;
}

/// CG 回收
class CgHideStatements implements Statements {
  late String _cgId;

  CgHideStatements({required String cgId}) {
    _cgId = cgId;
  }

  String get cgId => _cgId;
}

/// 分支跳转语句
/// 分支跳转语句和文件跳转语句都会造成文件的跳转
/// 请将分支跳转或文件跳转放到文件的最后部分
/// 分支跳转和文件跳转语句之后的语句都不会被解析
/// 请不要将分支跳转和文件跳转语句同时放在一个文件里，这毫无意义
class BranchJumpStatements implements Statements {
  late List<BranchModel> _branchModelList;

  BranchJumpStatements({required List<BranchModel> branchModelList}) {
    _branchModelList = branchModelList;
  }

  List<BranchModel> get branchModelList => _branchModelList;
}

class BranchModel {
  late String _branchText;
  late String _fileName;

  BranchModel({required String branchText, required String fileName}) {
    _branchText = branchText;
    _fileName = fileName;
  }

  String get fileName => _fileName;

  String get branchText => _branchText;
}

/// 文件跳转语句
/// 分支跳转语句和文件跳转语句都会造成文件的跳转
/// 请将分支跳转或文件跳转放到文件的最后部分
/// 分支跳转和文件跳转语句之后的语句都不会被解析
/// 请不要将分支跳转和文件跳转语句同时放在一个文件里，这毫无意义
class FileJumpStatements implements Statements {
  late String _fileName;

  FileJumpStatements({required String fileName}) {
    _fileName = fileName;
  }

  String get fileName => _fileName;
}

/// 注册角色语句
/// 角色{
///   角色id;
///   角色姓名;
///   Map 角色动作表{动作id:file};
/// }
class RegisterRoleStatements implements Statements {
  late String _roleId;
  late String _name;
  late Map<String, String> _files;

  RegisterRoleStatements(
      {required String roleId,
        required String name,
        required Map<String, String> files}) {
    _roleId = roleId;
    _name = name;
    _files = files;
  }

  Map get files => _files;

  String get name => _name;

  String get roleId => _roleId;
}

/// 注册 CG 语句
/// CG{
///   CGId;
///   Map CGFiles{差分id:file}
/// }
class RegisterCgStatements implements Statements {
  late String _cgId;
  late Map<String, String> _files;

  RegisterCgStatements(
      {required String cgId, required Map<String, String> files}) {
    _cgId = cgId;
    _files = files;
  }

  Map<String, String> get files => _files;

  String get cgId => _cgId;
}
