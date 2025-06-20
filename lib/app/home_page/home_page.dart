import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/constants/colors.dart';
import 'package:sherlock_dev_tool/app/decode_xlog_file/decode_xlog_file_view.dart';
import 'package:sherlock_dev_tool/app/json_format/json_format_view.dart';

import 'home_page_logic.dart';
import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageLogic logic = Get.put(HomePageLogic());
    final HomePageState state = Get.find<HomePageLogic>().state;

    final pageList = [DecodeXlogFileComponent(), JsonFormatComponent()];

    return Scaffold(
      backgroundColor: AppColor.lightScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Sherlock Dev Tool v1.0.0",
          style: TextStyle(color: Color.fromARGB(255, 355, 33, 33), fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Row(
          children: [
            // 左侧导航栏
            Container(
              color: AppColor.mid6,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: state.tabBgColor,
                    child: GestureDetector(
                      onTap: () {
                        state.currentIndex.value = 0;
                      },
                      child: Text(
                        '日志文件解码',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.lText1),
                      ),
                    ),
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: state.tabBgColor,
                    child: GestureDetector(
                      onTap: () {
                        state.currentIndex.value = 1;
                      },
                      child: Text(
                        'Json格式化',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.lText1),
                      ),
                    ),
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: state.tabBgColor,
                    child: GestureDetector(
                      onTap: () {
                        state.currentIndex.value = 1;
                      },
                      child: Text(
                        'svga预览',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.lText1),
                      ),
                    ),
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: state.tabBgColor,
                    child: GestureDetector(
                      onTap: () {
                        state.currentIndex.value = 1;
                      },
                      child: Text(
                        'adb命令',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.lText1),
                      ),
                    ),
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: state.tabBgColor,
                    child: GestureDetector(
                      onTap: () {
                        state.currentIndex.value = 1;
                      },
                      child: Text(
                        '设置',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.lText1),
                      ),
                    ),
                  ),


                ],
              ),
            ),

            Expanded(
              child: GetX<HomePageLogic>(
                init: Get.find<HomePageLogic>(),
                initState: (_) {},
                builder: (logic) {
                  return Container(child: pageList[state.currentIndex.value]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
