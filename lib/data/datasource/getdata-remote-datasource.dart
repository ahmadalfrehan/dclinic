import 'package:dclinic/Conf/Debug/out.dart';
import 'package:dclinic/data/database/sqlite.dart';
import 'package:dclinic/data/model/returned.dart';

import '../../Conf/core/data/datasource/base_remote_datasource.dart';
import '../../domain/entites/patient.dart';

abstract class GetDataRemoteDataSource extends BaseRemoteDataSourceImpl {
  GetDataRemoteDataSource({required super.dio});

  Future<List<ReturnedModel>> getData();
}

class GetDataRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements GetDataRemoteDataSource {
  GetDataRemoteDataSourceImpl({required super.dio});

  @override
  Future<List<ReturnedModel>> getData() async {
    SQLite.init();
    var result = await SQLite.makeQuery();
    log('result in get remote');
    log(result.toString());
    List<ReturnedModel> patients = [];
    // var datad = json.decode(result);
    Map<String, dynamic> data = Map<String, dynamic>.from(result);
    // for (var i in result) {
    log(data);

    patients.add(ReturnedModel.fromJson(data));
    // }
    log('pateReturnedModel$patients');
    // log(patients[0].patients[0].name);
    List<Patient> d = [];
    return patients;
  }
}
