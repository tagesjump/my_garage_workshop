import 'package:drift/drift.dart';

// ignore: depend_on_referenced_packages
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/infra/models/auto_mileage.dart';
import 'package:my_garage/src/internal/infra/schemes/schema_v2.dart' as v2;
import 'package:my_garage/src/internal/infra/tables/auto_mileage_table.dart';
import 'package:my_garage/src/internal/infra/tables/auto_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [AutoTable, AutoMileageTable])
@lazySingleton
class Database extends _$Database {
  Database(super.database);

  /// NOTE: After each version change, you need to make a dump
  ///
  /// dart run drift_dev schema dump lib/src/internal/infra/database.dart ./drift_schemas/drift_schema_v<SCHEMA_VERSION>.json
  /// dart run drift_dev schema generate drift_schemas/ ./lib/src/internal/infra/schemes --data-classes --companions
  ///
  @override
  int get schemaVersion => schema;

  static int get schema => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (_) async {
        if (kDebugMode) {
          // This check pulls in a fair amount of code that's not needed
          // anywhere else, so we recommend only doing it in debug builds.
          await validateDatabaseSchema();
        }
      },
      onUpgrade: (m, before, now) async {
        for (var target = before + 1; target <= now; target++) {
          if (target == 2) {
            await m.createTable(v2.AutoMileage(this));
          } else if (target == 3) {
            // TODO(DanilAbdrafikov): Implement migration for next target(done)
            await m.alterTable(
                TableMigration(autoMileageTable, columnTransformer: {
              autoMileageTable.id: const CustomExpression('id'),
              autoMileageTable.autoId: const CustomExpression('auto_id'),
              autoMileageTable.value: const CustomExpression('value'),
              autoMileageTable.createdAt: const CustomExpression('created_at'),
            }));
          }
        }
      },
    );
  }
}
