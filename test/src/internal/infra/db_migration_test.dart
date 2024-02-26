import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_garage/src/internal/infra/database.dart';
import 'package:my_garage/src/internal/infra/schemes/schema.dart';

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('Upgrade', () {
    final availableVersions = 1.upTo(Database.schema);
    final lastVersion = availableVersions.last;

    for (final from in availableVersions.reversed) {
      test('upgrade from v$from to v$lastVersion', () async {
        final connection = await verifier.startAt(from);
        final db = Database(connection);
        addTearDown(db.close);
        await verifier.migrateAndValidate(db, lastVersion);
      });
    }
  });
}

extension RangeExtension on int {
  List<int> upTo(
    int maxInclusive, {
    int stepSize = 1,
    List<int> exclude = const [],
  }) {
    return [for (int i = this; i <= maxInclusive; i += stepSize) i]
      ..removeWhere((i) => exclude.contains(i));
  }
}
