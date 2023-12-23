import 'package:shared_preferences/shared_preferences.dart';



abstract class BaseLocalDataSource {


}

class BaseLocalDataSourceImpl extends BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImpl({required this.sharedPreferences});


}
