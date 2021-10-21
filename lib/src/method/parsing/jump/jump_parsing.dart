import 'package:delusion_script/src/model/statements_model.dart';

import '../../split_extract.dart';

/// 解析分支跳转语句
/// #branch-{
///     分支选项1-分支1.dw,
///     分支选项2-分支2.dw,
/// }
parsingBranchJumpStatements(String dw, List<Statements> retStatementsList) {
  var statementsList = cuttingFromComma(getCurlyBraces(dw).trim());
  List<BranchModel> branchModelList = [];
  for (var elem in statementsList) {
    elem = elem.trimLeft();
    var elemList = cuttingFromMinus(elem);
    branchModelList
        .add(BranchModel(branchText: elemList.first, fileName: elemList.last));
  }
  retStatementsList.add(BranchJumpStatements(branchModelList: branchModelList));
}

/// 解析文件跳转语句
/// #jump-文件.dw
parsingFileJumpStatements(String dw, List<Statements> retStatementsList) {
  retStatementsList
      .add(FileJumpStatements(fileName: cuttingFromMinus(dw).last));
}
