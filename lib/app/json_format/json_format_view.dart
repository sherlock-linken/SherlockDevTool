import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'json_format_logic.dart';
import 'json_format_state.dart';

class JsonFormatComponent extends StatelessWidget {
  JsonFormatComponent({Key? key}) : super(key: key);

  final JsonFormatLogic logic = Get.put(JsonFormatLogic());
  final JsonFormatState state = Get.find<JsonFormatLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.lightScaffoldBackgroundColor, body: Container(color: AppColor.test2,
    child: Column(

        children: [

          Row(
            children: [

              Text("当前解码文件路径："),

              Text("asdfasdfasdf")

            ],
          )





      ],

    )


      ,));
  }
}
