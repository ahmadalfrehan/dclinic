import 'package:dclinic/data/database/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Config/routes/app-pages.dart';
import 'Config/routes/app-routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SQLite.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      defaultTransition: Transition.upToDown,
      initialRoute: AppRoutes.HOME,
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
