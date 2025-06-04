import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/constants/colors.dart';
import 'package:sherlock_dev_tool/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sherlock Dev Tool',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      builder: FlutterSmartDialog.init(),
    );
  }
}
