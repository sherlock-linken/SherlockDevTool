import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/constants/colors.dart';
import 'package:sherlock_dev_tool/app/decode_xlog_file/decode_xlog_file_view.dart';
import 'package:sherlock_dev_tool/app/home_page/navigator_button_widget.dart';
import 'package:sherlock_dev_tool/app/json_format/json_format_view.dart';

import '../setting/setting_view.dart';
import 'home_page_logic.dart';
import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageLogic logic = Get.put(HomePageLogic());
    final HomePageState state = Get.find<HomePageLogic>().state;

    final pageList = [DecodeXlogFileComponent(), JsonFormatComponent(), ComingSoonView(),SettingComponent()];

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
                  NavigatorButtonWidget(
                    text: '日志文件解码',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(
                        pageList.firstWhere((it) => it is DecodeXlogFileComponent),
                      );
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  NavigatorButtonWidget(
                    text: 'Json格式化',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(
                        pageList.firstWhere((it) => it is JsonFormatComponent),
                      );
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  NavigatorButtonWidget(
                    text: 'svga预览',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(pageList.firstWhere((it) => it is ComingSoonView));
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  NavigatorButtonWidget(
                    text: 'adb命令',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(pageList.firstWhere((it) => it is ComingSoonView));
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  NavigatorButtonWidget(
                    text: '我的logcat',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(pageList.firstWhere((it) => it is ComingSoonView));
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  NavigatorButtonWidget(
                    text: 'tiny压缩',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(pageList.firstWhere((it) => it is ComingSoonView));
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),

                  NavigatorButtonWidget(
                    text: '设置',
                    onTap: () {
                      state.currentIndex.value = pageList.indexOf(pageList.firstWhere((it) => it is SettingComponent));
                    },
                  ),

                  Divider(height: 1, color: AppColor.mid2),
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

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: AppColor.test1,
        child: Text("敬请期待", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
