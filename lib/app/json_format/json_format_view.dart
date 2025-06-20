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
    return Scaffold(
      backgroundColor: AppColor.lightScaffoldBackgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: logic.inputController,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // 边框样式
                  hintText: '请输入JSON内容', // 提示文本
                  labelText: 'JSON输入', // 标签文本
                ),
                keyboardType: TextInputType.multiline, // 键盘类型设置为多行
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              ElevatedButton(
                onPressed: () {
                  logic.formatJson();
                },
                child: Text(">>格式化>>"),
              ),

              SizedBox(height: 100,),

              ElevatedButton(
                onPressed: () {
                  logic.formatUrl();
                },
                child: Text(">>Url整理>>"),
              ),

              SizedBox(height: 20,),


              ElevatedButton(
                onPressed: () {
                  logic.justCorrectString();
                },
                child: Text(">>整理json>>"),
              ),
            ],
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: logic.outputController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // 边框样式
                  hintText: '请输入JSON内容', // 提示文本
                  labelText: 'JSON输出', // 标签文本
                ),
                keyboardType: TextInputType.multiline, // 键盘类型设置为多行
              ),
            ),
          ),
        ],
      ),
    );
  }
}
