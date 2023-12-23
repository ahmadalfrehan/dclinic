import 'package:dclinic/data/database/sqlite.dart';

import '../../Config/core/data/datasource/base_remote_datasource.dart';
import '../../domain/entites/patient.dart';

abstract class GetDataRemoteDataSource extends BaseRemoteDataSourceImpl {
  GetDataRemoteDataSource({required super.dio});

  Future<Patient> getData();
}

class GetDataRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements GetDataRemoteDataSource {
  GetDataRemoteDataSourceImpl({required super.dio});

  @override
  Future<Patient> getData() async {
    SQLite.init();
    var result = await SQLite.makeQuery();
    return result;
  }
}
