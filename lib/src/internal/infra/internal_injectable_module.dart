import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/internal/ui/common/bloc_log_observer.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@module
abstract class InternalInjectableModule {
  const InternalInjectableModule();

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

  @singleton
  BlocObserver get blocObserver {
    Bloc.observer = const BlocLogObserver();
    return Bloc.observer;
  }
}
