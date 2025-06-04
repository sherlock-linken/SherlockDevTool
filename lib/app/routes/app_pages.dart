import 'package:get/get.dart';
import 'package:sherlock_dev_tool/app/home_page/home_page.dart';
import 'package:sherlock_dev_tool/app/home_page/home_page_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomePageBinding()),
    // GetPage(
    //   name: Routes.AUTH,
    //   page: () => AuthScreen(),
    //   binding: AuthBinding(),
    //   children: [
    //     GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
    //     GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    //   ],
    // ),
    // GetPage(
    //     name: Routes.HOME,
    //     page: () => HomeScreen(),
    //     binding: HomeBinding(),
    //     children: [
    //       GetPage(name: Routes.CARDS, page: () => CardsScreen()),
    //     ]),
  ];
}
