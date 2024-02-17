import 'package:drift/drift.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';

@UseRowClass(Auto)
class AutoTable extends Table {
  const AutoTable();

  @override
  String get tableName => 'auto';

  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer()();

  TextColumn get brand => text()();

  TextColumn get model => text()();

  IntColumn get year => integer()();

  TextColumn get bodyNumber => text().nullable()();

  TextColumn get chassisNumber => text().nullable()();

  TextColumn get vin => text().nullable()();

  IntColumn get mileage => integer().nullable()();
}
