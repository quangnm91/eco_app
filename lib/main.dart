import 'package:eco_app/config/config_key.dart';
import 'package:eco_app/core/utils/secure_storage_helper.dart';
import 'package:eco_app/injector.dart';
import 'package:eco_app/presentation/scenes/let_us_in/let_us_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await dotenv.load(fileName: ".env");
  await setupConfig();
  await initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const LetUsInScreen(),
      routes: routes,
    );
  }
}

Future<void> setupConfig() async {
  await SecureStorageHelper.setString(ConfigKey.apiUrl, dotenv.get('API_URL'));
  await SecureStorageHelper.setString(
      ConfigKey.appName, dotenv.get('APP_NAME', fallback: 'ECO APP'));
}
