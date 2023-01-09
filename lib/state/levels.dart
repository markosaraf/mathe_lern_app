import 'package:get/get.dart';

class LevelsState extends GetxController {
  final currentOperation = ''.obs; // 'plus', 'minus', 'multi'
  final currentMax = 0.obs; // 10, 20, 100

  final plus10Solved = false.obs;
  final plus20Solved = false.obs;
  final plus100Solved = false.obs;

  final minus10Solved = false.obs;
  final minus20Solved = false.obs;
  final minus100Solved = false.obs;

  final multi10Solved = false.obs;
  final multi20Solved = false.obs;
  final multi100Solved = false.obs;

  updateCurrentOperation(String operation) {
    currentOperation(operation);
  }

  updateCurrentMax(int max) {
    currentMax(max);
  }

  updatePlus10Solved(bool solved) {
    plus10Solved(solved);
  }

  updatePlus20Solved(bool solved) {
    plus20Solved(solved);
  }

  updatePlus100Solved(bool solved) {
    plus100Solved(solved);
  }

  updateMinus10Solved(bool solved) {
    minus10Solved(solved);
  }

  updateMinus20Solved(bool solved) {
    minus20Solved(solved);
  }

  updateMinus100Solved(bool solved) {
    minus100Solved(solved);
  }

  updateMulti10Solved(bool solved) {
    multi10Solved(solved);
  }

  updateMulti20Solved(bool solved) {
    multi20Solved(solved);
  }

  updateMulti100Solved(bool solved) {
    multi100Solved(solved);
  }
}
