import 'dart:developer';

import 'package:dclinic/data/database/statement.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLite {
  static Database? db;

  static init() async {
    sqfliteFfiInit();
    DatabaseFactory databaseFactory = databaseFactoryFfi;
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final databasePath = '${appDocumentsDir.path}/dClinic.db';
    db = await databaseFactory.openDatabase(databasePath);
    await createDataBase();
  }

  static createDataBase() async {
    await db?.execute(Statement.patientTable);
    await db?.execute(Statement.familyTable);
    await db?.execute(Statement.treatmentTable);
    await db?.execute(Statement.paymentTable);
    await db?.execute(Statement.treatmentOptionTable);
  }

  static insertDataBase() async {
    await db?.insert(
      'Patient',
      <String, Object?>{
        'Name': 'John Doe',
        'PhoneNumber': '123-456-7890',
        'Address': '123 Main St'
      },
    );
    await db?.insert(
      'FamilyGroup',
      <String, Object?>{
        'PatientID': 1, // Replace with the actual PatientID
        'Relationship': 'Father',
      },
    );
    await db?.insert(
      'Treatment',
      <String, Object?>{
        'PatientID': 1, // Replace with the actual PatientID
        'Governorate': 'Treatment A',
        'Restoration': 'Restoration A',
        'GumTreatment': 'Gum A',
        'TakeOff': 'Take off A',
        'ReProcessing': 'Re-processing A',
        'Dow': 'Dow A',
        'Price': 100.00,
        'ToothNumber': 1,
        'Date': '2023-01-01',
      },
    );
    await db?.insert(
      'Payment',
      <String, Object?>{
        'PatientID': 1, // Replace with the actual PatientID
        'Amount': 50.00,
        'Date': '2023-01-15',
      },
    );
    await db?.insert(
      'TreatmentOptions',
      <String, Object?>{
        'TreatmentType': 'Governorate',
        'OptionName': 'Standard',
        'Price': 50.00,
      },
    );
  }

  static makeQuery() async {
    var result = await db?.query('Patient');
    var result1 = await db?.query('FamilyGroup');
    var result2 = await db?.query('Treatment');
    var result3 = await db?.query('Payment');
    var result4 = await db?.query('TreatmentOptions');
    log(result.toString());
    log(result1.toString());
    log(result2.toString());
    log(result3.toString());
    log(result4.toString());
    return result;
  }
}
