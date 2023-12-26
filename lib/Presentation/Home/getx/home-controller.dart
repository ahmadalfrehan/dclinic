import 'package:dclinic/domain/usecase/gethomedata.dart';
import 'package:get/get.dart';

import '../../../injection.dart';

class HomeController extends GetxController{
@override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
  GetHomeDataUseCase getHomeDataUseCase  = sl();
  final result = getHomeDataUseCase(
''
  );
  print(result);
  }
}