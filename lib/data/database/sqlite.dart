import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLite {
  static Database? db;

  static init() async {
    sqfliteFfiInit();
    DatabaseFactory databaseFactory = databaseFactoryFfi;
    const databasePath = 'your_database.db';
    db = await databaseFactory.openDatabase(databasePath);
  }

  static createDataBase() async {
    await db?.execute(
      '''
  CREATE TABLE IF NOT EXISTS Patient (
      PatientID INTEGER PRIMARY KEY,
      Name TEXT,
      PhoneNumber TEXT,
      Address TEXT
  )
  ''',
    );
  }

  static insertDataBase() async {
    await db?.insert(
      'Patient',
      <String, Object?>{
        'Name': 'Product 1',
        'PhoneNumber': '1111',
        'Address': 'ggg'
      },
    );
  }

  static makeQuery() async {
    var result = await db?.query('Patient');
    return result;
  }
}
