import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/homepage.dart';
import 'screens/exercises.dart';
import 'screens/exercise.dart';
import 'screens/cats.dart';

void main() {
  final controller = Get.put(BottomNavigationBarController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fade,
    initialRoute: '/home',
    onGenerateRoute: controller.onGenerateRoute,
    getPages: [
      GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
      GetPage(name: '/exercises', page: () => ExercisesPage()),
      GetPage(name: '/exercise', page: () => ExercisePage()),
      GetPage(name: '/cats', page: () => CatsPage()),
    ],
  ));
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
  }
}

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/home', '/exercises', '/cats'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index]);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home')
      return GetPageRoute(
        settings: settings,
        page: () => HomePage(),
        //binding: BrowseBinding(),
      );

    if (settings.name == '/exercises')
      return GetPageRoute(
        settings: settings,
        page: () => ExercisesPage(),
        //binding: HistoryBinding(),
      );

    if (settings.name == '/cats')
      return GetPageRoute(
        settings: settings,
        page: () => CatsPage(),
        //binding: SettingsBinding(),
      );
    return null;
  }
}
