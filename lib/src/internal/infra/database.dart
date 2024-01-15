import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'database.g.dart';

@DriftDatabase()
@lazySingleton
class Database extends _$Database {
  Database(super.database);

  @override
  int get schemaVersion => 1;
}
