import 'dart:io';

import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/utils/sp_util.dart';

class DecodeXlogFileState {
  DecodeXlogFileState() {
    ///Initialize variables

    SpUtil().getXlogPyFilePath().then((path) {
      pyFilePath.value = path;
      File(path).exists().then((value) {
        pyFileExist.value = value;
      });
    });
  }

  final RxString pyFilePath = "".obs;
  final RxBool pyFileExist = true.obs;

  final RxString xlogFilePath = "".obs;

  final RxString tips = "".obs;

}
