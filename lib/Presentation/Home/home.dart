import 'package:dclinic/conf/Debug/sizedbox-extension.dart';
import 'package:dclinic/conf/style/app-text-style.dart';
import 'package:dclinic/conf/theme/app-themes.dart';
import 'package:dclinic/domain/entites/patient.dart';
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
              width: Get.width / 5,
              decoration: const BoxDecoration(
                color: AppTheme.darkBlue9,
              ),
              child: Column(
                children: [
                  _button('Home', () => null, Icons.home),
                  5.0.spaceY,
                  _button('Add Patient', () => null, Icons.add),
                  5.0.spaceY,
                  _button('Search', () => null, Icons.search),
                ],
              ),
            ),
            7.0.spaceX,
            Expanded(
              child: Column(
                children: [
                  10.0.spaceY,
                  Row(
                    children: [
                      roundedWidget('Sorted', () => null, true),
                      4.0.spaceX,
                      roundedWidget('Debt', () => null, null),
                      4.0.spaceX,
                      roundedWidget('Families', () => null, null),
                      4.0.spaceX,
                      roundedWidget('Finished', () => null, null),
                    ],
                  ),
                  10.0.spaceY,
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _patient(controller.patient[0].patients[index]);
                    },
                    itemCount: controller.patient[0].patients.length,
                  ))
                ],
              ),
            ),
            5.0.spaceX,
          ],
        ),
      );
    });
  }

  roundedWidget(String text, Function() function, bool? select) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: select == true ? AppTheme.darkBlue : null,
        border: Border.all(color: AppTheme.greyColor),
      ),
      child: Text(text,
          style: select == true
              ? AppTextStyle.textStyleWith400Weight12SizeWhiteColor
              : AppTextStyle.textStyleWith500Weight15SizeDarkBlueColor),
    );
  }

  _patient(Patient patient) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.darkBlue9,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.21),
            blurRadius: 17,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(patient.name.toString(),
              style: AppTextStyle.textStyleWith700Weight20SizeWhiteColor),
          Text(patient.phone.toString(),
              style: AppTextStyle.textStyleWith400Weight12SizeWhiteColor),
          Text(patient.address.toString(),
              style: AppTextStyle.textStyleWith500Weight12SizeWhite133Color),
        ],
      ),
    );
  }

  _button(String text, Function() function, IconData icon) {
    return MaterialButton(
      onPressed: function,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style:
                        AppTextStyle.textStyleWith500Weight15SizeDarkBlueColor),
                Icon(
                  icon,
                  color: AppTheme.darkBlue,
                ),
              ],
            ),
          )),
    );
  }
}
