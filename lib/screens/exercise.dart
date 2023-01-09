import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:get/get.dart';
import '../main.dart';
import 'dart:async';
import '../state/levels.dart';

//random integer from [min], inclusive, to [max], inclusive
final _random = Random();
int randomInt(int min, int max) => min + _random.nextInt(max - min + 1);
int randomIntUpToN(N) => randomInt(0, N);

class ExercisePage extends StatefulWidget {
  //ExercisePage({super.key});
  const ExercisePage({Key? key}) : super(key: key);
  final String title = '';

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final bnbController = Get.put(BottomNavigationBarController());
  final controller = TextEditingController();
  final lvlController = Get.put(LevelsState());
  int _counterTotal = 0;
  int _counterCorrect = 0;
  int _x = randomIntUpToN(10);
  int _y = randomIntUpToN(10);
  int y_max = 0;
  int _answer = -1;
  String _previousAnswer = 'None';
  String operation_symbol = 'v';
  String feedback = 'None';

  //Timer _timer;
  bool _didnt_start_timer = true;
  int _timer_value = 120;
  void startTimer() {
    Timer _timer;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timer_value == 0) {
          timer.cancel();
        } else {
          _timer_value--;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final operation = lvlController.currentOperation.value.toString();
    final max_val = lvlController.currentMax.value.toInt();
    // (Re)build widget
    if (_didnt_start_timer) {
      startTimer();
      _didnt_start_timer = false;
    }
    if (operation == 'multi') {
      _x = randomIntUpToN(max_val - 1) + 1;
      _x = sqrt(_x).toInt();
    } else {
      _x = randomIntUpToN(max_val);
    }
    if (operation == 'plus') {
      y_max = max_val - _x;
      operation_symbol = '+';
    } else if (operation == 'minus') {
      y_max = _x;
      operation_symbol = '-';
    } else {
      y_max = (max_val / _x).toInt();
      operation_symbol = '*';
    }
    _y = randomIntUpToN(y_max);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Letzte Antwort:',
            ),
            Text(
              _previousAnswer,
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text(
              'Versuche:',
            ),
            Text(
              '$_counterTotal',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text(
              'Richtig:',
            ),
            Text(
              '$_counterCorrect',
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(height: 20),
            const Text('Zeit:'),
            Text(_timer_value.toString(), style: const TextStyle(fontSize: 24)),
            Container(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [question(_x, _y, operation_symbol)],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofocus: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 42, color: Colors.blue),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Weiter',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _evaluateAnswer(operation, operation_symbol, max_val);
              },
            ),
          ],
        ),
      ),
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
          currentIndex: bnbController.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: bnbController.changePage,
        ),
      ),
    );
  }

  void _evaluateAnswer(operation, operation_symbol, max_val) {
    setState(() {
      // Update state
      int true_score = -1;
      _counterTotal++;
      _answer = int.parse(controller.text);
      if (operation_symbol == '+') {
        true_score = _x + _y;
      } else if (operation_symbol == '-') {
        true_score = _x - _y;
      } else {
        true_score = _x * _y;
      }
      if (true_score == _answer) {
        _counterCorrect++;
        _previousAnswer = '$_x $operation_symbol $_y = $_answer is Richtig!';
      } else {
        _previousAnswer = '$_x $operation_symbol $_y = $_answer is Falsch!';
      }
      controller.clear();
      // level solved?
      int N_exercise = 10;
      if (_counterTotal == N_exercise &&
          _counterCorrect == N_exercise &&
          _timer_value > 0) {
        mark_level_solved(operation, max_val);
        feedback = 'Gut gemacht! Eine neue Katze Befreit!';
        Get.snackbar(
          'Geschafft!',
          feedback,
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        Future.delayed(const Duration(seconds: 5, milliseconds: 0), () {
          Get.toNamed('/cats');
        });
      } else if (_counterTotal == N_exercise) {
        feedback = 'Versuche nochmals!';
        Get.snackbar(
          'Aufgabe geendet.',
          feedback,
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        //sleep(const Duration(seconds: 2));
        Future.delayed(const Duration(seconds: 5, milliseconds: 0), () {
          Get.toNamed('/exercises');
        });
      }
    });
  }

  void mark_level_solved(operation, max_val) {
    if (operation == 'plus') {
      if (max_val == 10) {
        lvlController.updatePlus10Solved(true);
      } else if (max_val == 20) {
        lvlController.updatePlus20Solved(true);
      } else if (max_val == 100) {
        lvlController.updatePlus100Solved(true);
      }
    } else if (operation == 'minus') {
      if (max_val == 10) {
        lvlController.updateMinus10Solved(true);
      } else if (max_val == 20) {
        lvlController.updateMinus20Solved(true);
      } else if (max_val == 100) {
        lvlController.updateMinus100Solved(true);
      }
    } else if (operation == 'multi') {
      if (max_val == 10) {
        lvlController.updateMulti10Solved(true);
      } else if (max_val == 20) {
        lvlController.updateMulti20Solved(true);
      } else if (max_val == 100) {
        lvlController.updateMulti100Solved(true);
      }
    }
  }
}

Widget question(x, y, operation_symbol) {
  return Row(
    children: [
      Text(
        x.toString(),
        style: const TextStyle(fontSize: 48),
      ),
      Text(
        operation_symbol,
        style: const TextStyle(fontSize: 32),
      ),
      Text(
        y.toString(),
        style: const TextStyle(fontSize: 48),
      )
    ],
  );
}

Widget answer() {
  TextEditingController textFieldController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: TextField(
      controller: textFieldController,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    ),
  );
}
