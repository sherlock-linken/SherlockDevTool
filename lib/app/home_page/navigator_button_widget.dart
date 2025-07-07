import 'package:flutter/widgets.dart';
import 'package:sherlock_dev_tool/app/constants/colors.dart';

class NavigatorButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const NavigatorButtonWidget({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      color: AppColor.tabColor,
      child: GestureDetector(
        onTap: () {
          onTap.call();
        },
        child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.lText1)),
      ),
    );
  }
}
