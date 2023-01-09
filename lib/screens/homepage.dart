import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mathe-Lern App')),
      body: Center(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
            child: Text('Spiele Mathe', style: motivationTextStyle),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [motivationHeart, motivationHeart, motivationHeart]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text('um Katzen zu befreien', style: motivationTextStyle),
          ),
          Image.asset('lib/images/cat3.png'),
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: ElevatedButton(
              child: const Text('Los'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () => Get.toNamed('/exercises'),
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

  final motivationTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 30,
  );

  final motivationHeart = const Icon(
    Icons.favorite,
    color: Colors.pink,
    size: 24.0,
  );
}
