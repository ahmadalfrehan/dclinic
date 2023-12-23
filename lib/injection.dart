import 'package:get_it/get_it.dart';

import 'Config/core/data/datasource/base_local_datasource.dart';
import 'Config/core/data/datasource/base_remote_datasource.dart';

final sl = GetIt.instance;
Future<void> init() async {

  sl.registerLazySingleton<BaseRemoteDataSourceImpl>(
        () => BaseRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<BaseLocalDataSource>(
        () => BaseLocalDataSourceImpl(sharedPreferences: sl()),
  );

}
