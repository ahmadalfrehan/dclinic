class Statement {
  static String patientTable = '''
  CREATE TABLE IF NOT EXISTS Patient (
      PatientID INTEGER PRIMARY KEY,
      Name TEXT,
      PhoneNumber TEXT,
      Address TEXT
  )
  ''';
  static String familyTable = ''' CREATE TABLE IF NOT EXISTS FamilyGroup (
        GroupID INTEGER PRIMARY KEY,
        PatientID INTEGER REFERENCES Patient(PatientID),
    Relationship TEXT
    )
''';
  static String treatmentTable = '''
    CREATE TABLE IF NOT EXISTS Treatment (
    TreatmentID INTEGER PRIMARY KEY,
    PatientID INTEGER REFERENCES Patient(PatientID),
    Governorate TEXT,
    Restoration TEXT,
    GumTreatment TEXT,
    TakeOff TEXT,
    ReProcessing TEXT,
    Dow TEXT,
    Price REAL,
    ToothNumber INTEGER,
    Date TEXT
);
    ''';
  static String paymentTable = '''
    CREATE TABLE IF NOT EXISTS Payment (
    PaymentID INTEGER PRIMARY KEY,
    PatientID INTEGER REFERENCES Patient(PatientID),
    Amount REAL,
    Date TEXT
);
    ''';
  static String treatmentOptionTable = '''
  CREATE TABLE IF NOT EXISTS TreatmentOptions (
    OptionID INTEGER PRIMARY KEY,
    TreatmentType TEXT,
    OptionName TEXT,
    Price REAL
);

  ''';
}
