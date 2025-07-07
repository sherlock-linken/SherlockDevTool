import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../utils/sp_util.dart';
import 'decode_xlog_file_state.dart';

class DecodeXlogFileLogic extends GetxController {
  final DecodeXlogFileState state = DecodeXlogFileState();

  void decodeXlogFile() {
    //TODO: 调用python脚本
    if (state.pyFilePath.value.isEmpty || state.xlogFilePath.value.isEmpty) {
      SmartDialog.showToast('请选择解码文件和xlog文件');
      return;
    }

    if (!state.pyFilePath.value.endsWith('.py') || !state.xlogFilePath.value.endsWith('.xlog')) {
      SmartDialog.showToast('请选择正确的解码文件和xlog文件');
      return;
    }

    onDecodeXlogFile().then((value) async {
      print("解析完成 ${Platform.isMacOS}");
      var dir = Directory(state.xlogFilePath.value.substring(0, state.xlogFilePath.value.lastIndexOf('/')));
      if (Platform.isMacOS) {
        await Process.run('open', [dir.path]); // macOS: open 命令
      } else if (Platform.isWindows) {
        await Process.run('explorer', [dir.path]); // Windows: explorer 命令
      } else if (Platform.isLinux) {
        await Process.run('xdg-open', [dir.path]); // Linux: xdg-open
      } else {
        throw UnsupportedError('Unsupported platform');
      }
    });
  }

  /// 开始解码
  Future<void> onDecodeXlogFile() async {
    if (state.pyFilePath.value.isEmpty || state.xlogFilePath.value.isEmpty) {
      SmartDialog.showToast('请选择解码文件和xlog文件');
      return;
    }

    try {
      final pythonPath = "/opt/anaconda3/bin/python3";

      final result = await Process.run(pythonPath, [state.pyFilePath.value, state.xlogFilePath.value]);
      print("result == ${result.stdout} ${result.stderr}");
      if (result.exitCode == 0) {
        SmartDialog.showToast('解码成功: ${result.stdout}');
      } else {
        SmartDialog.showToast('解码失败: ${result.stderr}');
      }
    } catch (e) {
      print("e == $e");
      SmartDialog.showToast('执行错误: $e');
    }
  }

  /// 获取拖放的文件路径
  void getDropPyFile(DropDoneDetails details) async {
    try {
      // 处理拖放的文件路径
      final files = details.files;
      if (files.isNotEmpty) {
        state.pyFilePath.value = files[0].path;
        File(files[0].path).exists().then((value) {
          state.pyFileExist.value = value;
        });
        SpUtil().saveXlogPyFilePath(files[0].path);
      }
    } catch (e) {
      // 处理非文件拖放或其他错误
      SmartDialog.showToast('请拖放有效的文件');
    }
  }

  void selectPyFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['py'],
    );
    if (result != null) {
      state.pyFilePath.value = result.files.single.path!;
      SpUtil().saveXlogPyFilePath(state.pyFilePath.value);
    }
  }

  Future<void> test() async {
    final whichResult = await Process.run('which', ['python3']);
    print(whichResult.stdout.toString());
    if (whichResult.exitCode != 0) {
      throw Exception('Python 未安装');
    }
    state.tips.value = whichResult.stdout.toString().trim();
  }
}
