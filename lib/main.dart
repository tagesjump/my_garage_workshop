import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_garage/src/app.dart';
import 'package:my_garage/src/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  return runApp(const App());
}
