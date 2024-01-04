import 'package:dclinic/Conf/Debug/out.dart';
import 'package:dclinic/domain/usecase/gethomedata.dart';
import 'package:get/get.dart';

import '../../../data/model/returned.dart';
import '../../../injection.dart';

class HomeController extends GetxController {
  RxString sel = 'select'.obs;

  @override
  void onInit() {
    log('get');
    getData();
    super.onInit();
  }

  RxList<ReturnedModel> patient = <ReturnedModel>[].obs;

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
