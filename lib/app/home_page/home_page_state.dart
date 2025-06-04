import 'package:get/get.dart';

import '../constants/colors.dart';

class HomePageState {
  HomePageState() {
    currentIndex = RxInt(0);
  }

  var tabBgColor = AppColor.tabColor;

  var currentIndex = 0.obs;
}
