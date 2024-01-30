import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/internal/infra/tables/auto_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [AutoTable])
@lazySingleton
class Database extends _$Database {
  Database(super.database);

  @override
  int get schemaVersion => 1;
}
