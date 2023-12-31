import 'package:dclinic/data/database/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Conf/routes/app-pages.dart';
import 'Conf/routes/app-routes.dart';
import 'injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SQLite.init();
  await SQLite.createDataBase();

  await init();

  // var result = await SQLite.makeQuery();
  //
  // print(result);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      defaultTransition: Transition.upToDown,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.getPages(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Cario'),
      ),
    );
  }
}
