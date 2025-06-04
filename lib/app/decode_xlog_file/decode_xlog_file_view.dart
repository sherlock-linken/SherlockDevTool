import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/constants/colors.dart';
import 'package:sherlock_dev_tool/app/utils/sp_util.dart';

import 'decode_xlog_file_logic.dart';
import 'decode_xlog_file_state.dart';

class DecodeXlogFileComponent extends StatelessWidget {
  DecodeXlogFileComponent({Key? key}) : super(key: key);

  final DecodeXlogFileLogic logic = Get.put(DecodeXlogFileLogic());
  final DecodeXlogFileState state = Get.find<DecodeXlogFileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightScaffoldBackgroundColor,
      body: Column(
        children: [
          //解码文件
          DropTarget(
            onDragDone: (details) async {
              logic.selectedPyFile(details);
            },
            child: Container(
              color: AppColor.test1,
              height: 100,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    GestureDetector(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['py'],
                        );
                        if (result != null) {
                          state.pyFilePath.value = result.files.single.path!;
                        }
                      },
                      child: Text("当前解码文件路径："),
                    ),

                    Flexible(
                      child: Obx(() {
                        return Text(state.pyFilePath.value, softWrap: true, overflow: TextOverflow.visible);
                      }),
                    ),

                    Flexible(
                      child: Obx(() {
                        return !state.pyFileExist.value
                            ? Text(
                              "文件不存在",
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: TextStyle(color: AppColor.funRed),
                            )
                            : SizedBox();
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          //xlog文件
          Expanded(
            child: DropTarget(
              onDragDone: (details) async {
                try {
                  // 处理拖放的文件路径
                  final files = details.files;
                  if (files.isNotEmpty) {
                    state.xlogFilePath.value = files[0].path;
                  }
                } catch (e) {
                  // 处理非文件拖放或其他错误
                  SmartDialog.showToast('请拖放有效的文件');
                }
              },
              child: Column(
                children: [
                  Container(
                    color: AppColor.test1,
                    height: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          GestureDetector(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['xlog'],
                              );
                              if (result != null) {
                                state.pyFilePath.value = result.files.single.path!;
                              }
                            },
                            child: Text("当前xlog文件路径："),
                          ),

                          Flexible(
                            child: Obx(() {
                              return Text(state.xlogFilePath.value, softWrap: true, overflow: TextOverflow.visible);
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  //开始解码按钮
                  ElevatedButton(
                    onPressed: () {
                      logic.decodeXlogFile();
                    },
                    child: Text('开始解码'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
