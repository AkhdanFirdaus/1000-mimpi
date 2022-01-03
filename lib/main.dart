import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}
