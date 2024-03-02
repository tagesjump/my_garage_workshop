import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/infra/models/auto_mileage.dart';
import 'package:my_garage/src/internal/infra/database.dart';
import 'package:my_garage/src/internal/infra/tables/auto_mileage_table.dart';
import 'package:my_garage/src/internal/infra/tables/auto_table.dart';

part 'garage_repository.g.dart';

@lazySingleton
@DriftAccessor(tables: [AutoTable, AutoMileageTable])
class GarageRepository extends DatabaseAccessor<Database>
    with _$GarageRepositoryMixin {
  GarageRepository(super.db);

  Stream<List<Auto>> watchAutoList() => select(autoTable).watch();

  Future<void> insertAuto(Auto auto) async {
    await into(autoTable).insertOnConflictUpdate(auto);
  }

  Future<Auto?> getAutoById(int id) async {
    final query = (select(autoTable)
      ..where((tbl) => tbl.id.equals(id))
      ..limit(1));
    return query.getSingleOrNull();
  }

  Future<void> updateAutoById(int id,
      {String? bodyNumber,
      String? chassisNumber,
      String? vin,
      int? mileage}) async {
    await (update(autoTable)..where((tbl) => tbl.id.equals(id))).write(
        AutoTableCompanion(
            bodyNumber: Value(bodyNumber),
            chassisNumber: Value(chassisNumber),
            vin: Value(vin),
            mileage: Value(mileage)));
  }

  Future<void> deleteAutoById(int id) async {
    await (delete(autoTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Stream<List<AutoMileage>> watchMileagesForAuto(int autoId) =>
      (select(autoMileageTable)
            ..where((tbl) => tbl.autoId.equals(autoId))
            ..orderBy([
              (tbl) => OrderingTerm(
                  expression: tbl.createdAt, mode: OrderingMode.desc)
            ]))
          .watch();

  Future<void> insertMileage(AutoMileage autoMileage) async {
    await into(autoMileageTable).insertOnConflictUpdate(autoMileage);
  }

  Future<void> deleteMileagesByAutoId(int id) async {
    await (delete(autoMileageTable)..where((tbl) => tbl.autoId.equals(id))).go();
  }
}
