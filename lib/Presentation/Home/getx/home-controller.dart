import 'package:dclinic/Conf/Debug/out.dart';
import 'package:dclinic/domain/entites/patient.dart';
import 'package:dclinic/domain/usecase/gethomedata.dart';
import 'package:get/get.dart';

import '../../../injection.dart';

class HomeController extends GetxController{


  RxString sel = 'select'.obs;

  @override
  void onInit() {
    log('get');
    getData();
    super.onInit();
  }

  RxList<Patient> patient = <Patient>[].obs;

  getData() async {
    log('getData');
    GetHomeDataUseCase getHomeDataUseCase = sl();
    final result = await getHomeDataUseCase('');
    result.fold(
        (l) => {log(l), log(";;;lllllllll")},
        (r) => {
              log("rrrrrrrrrr"),
              log(r),
              patient.value = r,
            });
  }
}