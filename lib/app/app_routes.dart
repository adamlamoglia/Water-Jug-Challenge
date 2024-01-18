import 'package:get/get_navigation/get_navigation.dart';
import 'package:water_jug_challenge/modules/home/home_screen.dart';
import 'package:water_jug_challenge/modules/result/result_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String result = '/result';

  static List<GetPage> screens = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      arguments: const [],
    ),
    GetPage(
      name: result,
      page: () => ResultScreen(),
      transition: Transition.fadeIn,
      arguments: const [],
    ),
  ];
}
