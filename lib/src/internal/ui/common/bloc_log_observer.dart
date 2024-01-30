// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLogObserver extends BlocObserver {
  const BlocLogObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    final builder = [
      '[${bloc.runtimeType}]',
      'created with [${bloc.state.runtimeType}] state',
    ];
    return print('FINE: ${builder.join(' ')}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    final builder = ['[${bloc.runtimeType}]', change.nextState];
    return print('INFO: ${builder.join(' ')}');
  }

  @override
  void onClose(BlocBase bloc) {
    final builder = [
      '[${bloc.runtimeType}]',
      'closed with [${bloc.state.runtimeType}] state',
    ];
    print('INFO: ${builder.join(' ')}');
    return super.onClose(bloc);
  }
}
