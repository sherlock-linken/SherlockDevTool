import 'package:get/get.dart';

import 'json_format_logic.dart';

class JsonFormatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JsonFormatLogic());
  }
}
