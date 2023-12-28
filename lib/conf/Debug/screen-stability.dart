

import 'package:get/get.dart';

class ScreenStability {
  static const SCREEN_WIDTH = 427;
  static const SCREEN_HEIGHT = 932;

  static double width(var number) {
    SCREEN_WIDTH / number;
    var result = SCREEN_WIDTH / number;
    return Get.width / result;
  }

  static double height(var number) {
    var result = SCREEN_HEIGHT / number;
    return Get.height / result;
  }
}
