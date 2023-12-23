import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dclinic/Presentation/Splash/getx/splash-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(controller.text.value);
      return Scaffold(
        backgroundColor: Color(0xFF336699),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.size.height / 2),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'dClinic App',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 4,
                stopPauseOnTap: true,
              ),
              Spacer(),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'By ahmadalfrehan',

                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 4,
                stopPauseOnTap: true,
              ),
            ],
          ),
        ),
      );
    });
  }
}
