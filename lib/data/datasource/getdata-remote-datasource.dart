import 'dart:convert';

import 'package:dclinic/Conf/Debug/out.dart';
import 'package:dclinic/data/database/sqlite.dart';
import 'package:dclinic/data/model/patientModel.dart';

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
    List<Patient> patients = [];
    // var datad = json.decode(result);
    Map<String,dynamic>data =  Map<String,dynamic>.from(result);
    // for (var i in result) {
    //   log(i);

      patients.add(PatientModel.fromJson(data));
    // }
    log(patients);
    return patients;
  }
}
