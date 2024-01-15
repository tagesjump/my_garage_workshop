import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@module
abstract class InternalInjectableModule {
  @lazySingleton
  QueryExecutor get database {
    return LazyDatabase(
      () async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'db.sqlite'));
        return NativeDatabase.createInBackground(file);
      },
    );
  }
}
