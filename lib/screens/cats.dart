import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../state/levels.dart';

class CatsPage extends StatelessWidget {
  CatsPage({Key? key}) : super(key: key);
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
    int n_befreite = 0;
    if (plus10Solved) {
      n_befreite++;
    }
    if (plus20Solved) {
      n_befreite++;
    }
    if (plus100Solved) {
      n_befreite++;
    }
    if (minus10Solved) {
      n_befreite++;
    }
    if (minus20Solved) {
      n_befreite++;
    }
    if (minus100Solved) {
      n_befreite++;
    }
    if (multi10Solved) {
      n_befreite++;
    }
    if (multi20Solved) {
      n_befreite++;
    }
    if (multi100Solved) {
      n_befreite++;
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Befreite Katzen')),
      body: _buildGrid(n_befreite),
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

  // Grid from list
  Widget _buildGrid(int n) => GridView.extent(
      maxCrossAxisExtent: 200,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(n));

  // List
  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
          child: Image.asset('lib/images/cat${i + 1}.png', fit: BoxFit.cover)));
}
