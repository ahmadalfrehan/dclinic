import 'package:dclinic/data/datasource/getdata-remote-datasource.dart';
import 'package:dclinic/data/repository/get-data-repo-impl.dart';
import 'package:dclinic/domain/repositories/get-data-repo.dart';
import 'package:dclinic/domain/usecase/gethomedata.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'Conf/core/data/datasource/base_local_datasource.dart';
import 'Conf/core/data/datasource/base_remote_datasource.dart';
import 'Conf/core/data/repositories/base-Repo.dart';
import 'Conf/core/domain/Repository/base_local_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://ahmadalfrehan.com',
        connectTimeout: const Duration(minutes: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.plain,
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        responseBody: true,
        requestBody: true,
        responseHeader: true,
        requestHeader: true,
        request: true,
      ),
    );
    return dio;
  });
  sl.registerLazySingleton<BaseRemoteDataSourceImpl>(
    () => BaseRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<BaseLocalDataSource>(
    () => BaseLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerFactory<GetDataRemoteDataSource>(
    () => GetDataRemoteDataSourceImpl(dio: sl()),
  );

  ///REPOSITORY
  sl.registerFactory<GetDataRpo>(
    () => GetDataRepoImpl(authRemoteDataSource: sl()),
  );

  sl.registerFactory<BaseLocalRepo>(
    () => BaseLocalRepoImpl(baseLocalDataSource: sl()),
  );

  ///USECASE
  sl.registerFactory<GetHomeDataUseCase>(
    () => GetHomeDataUseCase(getDataRepo: sl()),
  );
}
