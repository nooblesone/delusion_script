library delusion_script;

import 'package:delusion_script/src/method/parsing/classification_parsing.dart';
import 'package:delusion_script/src/model/statements_model.dart';
export 'package:delusion_script/src/model/statements_model.dart';


/// 将 delusion script 剧本脚本传入，返回解析后的 Statements 语句对象列表
///
List<Statements> parsingDwStatements(String dw){
  return parsingWx(dw: dw);
}



