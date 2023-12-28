import 'package:dclinic/Conf/Debug/out.dart';
import 'package:dclinic/data/database/sqlite.dart';

import '../../Conf/core/data/datasource/base_remote_datasource.dart';
import '../../domain/entites/patient.dart';

abstract class GetDataRemoteDataSource extends BaseRemoteDataSourceImpl {
  GetDataRemoteDataSource({required super.dio});

  Future<List<Patient>> getData();
}

class GetDataRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements GetDataRemoteDataSource {
  GetDataRemoteDataSourceImpl({required super.dio});

  @override
  Future<List<Patient>> getData() async {
    SQLite.init();
    var result = await SQLite.makeQuery();
    log('result in get remote');
    log(result.toString());
    log(result is List<Patient>);
    return result;
  }
}
