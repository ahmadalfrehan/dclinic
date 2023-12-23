import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLite {
  static init() {
    sqfliteFfiInit();
  }

  createDataBase() async {
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await db.execute('''
  CREATE TABLE Patient (
      PatientID INTEGER PRIMARY KEY,
      Name TEXT,
      PhoneNumber TEXT,
      Address TEXT
  )
  ''');
  }
}
