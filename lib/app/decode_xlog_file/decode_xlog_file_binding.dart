import 'package:get/get.dart';

import 'decode_xlog_file_logic.dart';

class DecodeXlogFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DecodeXlogFileLogic());
  }
}
