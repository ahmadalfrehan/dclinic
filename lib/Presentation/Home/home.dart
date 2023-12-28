import 'package:dclinic/conf/style/app-text-style.dart';
import 'package:dclinic/conf/theme/app-themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx/home-controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(controller.sel.value);
      return Scaffold(
        body: Row(
          children: [
            Container(
              height: Get.height,
              width: Get.width/5,
              decoration: BoxDecoration(
                color: Colors.black54,

              ),
              child: Column(
                children: [
                  _button('Home', () => null,Icons.home),
                  _button('Add Patient', () => null,Icons.add),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(controller.patient.value[index].patients[0].name
                          .toString());
                    },
                    itemCount: controller.patient.length,
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  _button(String text, Function() function,IconData icon) {
    return InkWell(
      onTap: function,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,

          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Icon(icon,color: AppTheme.darkBlue,),
                Text(text,style: AppTextStyle.textStyleWith500Weight15SizeDarkBlueColor
                ),
              ],
            ),
          )),
    );
  }
}
