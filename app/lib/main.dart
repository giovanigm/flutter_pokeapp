import 'package:flutter/material.dart';

import 'app/app.dart';
import 'config/config_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configInjection();
  runApp(const App());
}
