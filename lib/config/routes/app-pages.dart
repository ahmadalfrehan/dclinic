import 'package:dclinic/Config/routes/app-routes.dart';
import 'package:dclinic/Presentation/Home/getx/home-bindings.dart';
import 'package:dclinic/Presentation/Splash/getx/splash-bindings.dart';
import 'package:dclinic/Presentation/Splash/splash.dart';
import 'package:get/get.dart';

import '../../Presentation/Home/home.dart';

class AppPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: AppRoutes.HOME,
        page: () => const Home(),
        binding: HomeBindings(),
      ),
      GetPage(
        name: AppRoutes.SPLASH,
        page: () => const Splash(),
        binding: SplashBindings(),
      ),
    ];
  }
}
