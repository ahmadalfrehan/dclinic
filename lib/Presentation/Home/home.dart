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
        drawer: const Drawer(
          backgroundColor: Colors.black54,
          child: Column(
            children: [
              Text('select'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(controller.patient.value[index].patients[0].name.toString());
              },
              itemCount: controller.patient.length,
            ))
          ],
        ),
      );
    });
  }
}
