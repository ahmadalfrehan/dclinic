import 'package:dclinic/Presentation/Home/getx/home-controller.dart';
import 'package:dclinic/conf/theme/app-themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPatient extends GetView<HomeController> {
  const AddPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container
      (
      height: Get.height/2,
      width: Get.width/2,
      decoration: BoxDecoration(
        color: AppTheme.white242,

      ),
    );
  }
}
