import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../state/levels.dart';

class ExercisesPage extends StatelessWidget {
  ExercisesPage({Key? key}) : super(key: key);
  final controller = Get.put(BottomNavigationBarController());
  final lvlController = Get.put(LevelsState());
  @override
  Widget build(BuildContext context) {
    final plus10Solved = lvlController.plus10Solved.value;
    final plus20Solved = lvlController.plus20Solved.value;
    final plus100Solved = lvlController.plus100Solved.value;
    final minus10Solved = lvlController.minus10Solved.value;
    final minus20Solved = lvlController.minus20Solved.value;
    final minus100Solved = lvlController.minus100Solved.value;
    final multi10Solved = lvlController.multi10Solved.value;
    final multi20Solved = lvlController.multi20Solved.value;
    final multi100Solved = lvlController.multi100Solved.value;
    return Scaffold(
      appBar: AppBar(title: const Text('Übungen')),
      body: Center(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: ElevatedButton(
              child: const Text('Addition bis 10'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              //onPressed: () => Get.toNamed('/exercise'),
              onPressed: plus10Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('plus');
                      lvlController.updateCurrentMax(10);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              child: const Text('Addition bis 20'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: plus20Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('plus');
                      lvlController.updateCurrentMax(20);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              child: const Text('Addition bis 100'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: plus100Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('plus');
                      lvlController.updateCurrentMax(100);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: ElevatedButton(
              child: const Text('Subtraktion bis 10'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: minus10Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('minus');
                      lvlController.updateCurrentMax(10);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              child: const Text('Subtraktion bis 20'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: minus20Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('minus');
                      lvlController.updateCurrentMax(20);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              child: const Text('Subtraktion bis 100'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: minus100Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('minus');
                      lvlController.updateCurrentMax(100);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: ElevatedButton(
              child: const Text('Multiplikation bis 10'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: multi10Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('multi');
                      lvlController.updateCurrentMax(10);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              child: const Text('Multiplikation bis 20'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: multi20Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('multi');
                      lvlController.updateCurrentMax(20);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              child: const Text('Multiplikation bis 100'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: multi100Solved
                  ? null
                  : () {
                      lvlController.updateCurrentOperation('multi');
                      lvlController.updateCurrentMax(100);
                      Get.toNamed('/exercise');
                    },
            ),
          ),
        ],
      )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Startseite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: 'Spiele Mathe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: 'Katzen',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
