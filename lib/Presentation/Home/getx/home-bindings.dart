import 'package:dclinic/Presentation/Home/home.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeBindings());
  }

}