import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/constants/colors.dart';

import 'setting_logic.dart';
import 'setting_state.dart';

class SettingComponent extends StatelessWidget {
  SettingComponent({Key? key}) : super(key: key);

  final SettingLogic logic = Get.put(SettingLogic());
  final SettingState state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.test1,
        padding: EdgeInsets.all(10),
        child: Text("this is setting page", style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
