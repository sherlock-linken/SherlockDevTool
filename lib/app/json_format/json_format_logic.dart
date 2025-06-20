import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/utils/TopFuns.dart';

import 'json_format_state.dart';

class JsonFormatLogic extends GetxController {
  final JsonFormatState state = JsonFormatState();

  final RxString jsonString = "".obs;

  final RxString jsonStringFormatted = "".obs;

  final RxString errorTips = "".obs;

  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();

  final JsonEncoder encoder = JsonEncoder.withIndent("  ");

  void formatJson() {
    var jsonString = _correctString(inputController.text);

    try {
      var json = jsonDecode(jsonString);
      var formattedJson = encoder.convert(json);
      outputController.text = formattedJson;
    } catch (e) {
      errorTips.value = e.toString();
      outputController.text = e.toString();
      toastMsg(e.toString());
    }
  }

  void formatUrl() {
    var jsonString = inputController.text;

    jsonString = jsonString.trim().replaceFirst("?","\n\n");
    jsonString = jsonString.replaceAll("&","\n");

    outputController.text = jsonString;
  }

  void justCorrectString() {
    var jsonString = _correctString(inputController.text);
    outputController.text = jsonString;
  }

  String _correctString(String mData) {
    var data = mData.trim();
    var strList = data.split("\n");
    var result = "";

    for (int i = 0; i < strList.length; i++) {
      var str = strList[i];
      if (i == 0) {
        if (str.startsWith("{")) {
          result += str;
        } else {
          var index = str.indexOf("{");
          result += str.substring(index, str.length);
        }
      } else if (str.length > 107) {
        result += str.substring(107, str.length);
      } else {
        print("the rest str: $str");
      }
    }

    if (!result.endsWith("}")) {
      var index = result.lastIndexOf("}");
      result = result.substring(0, index + 1);
    }

    return result;
  }

  void test() {
    var str = inputController.text;
    var result = str.replaceAll("\n",r"\n");
    print("str: $result");



    toastMsg("Test");
  }
}
