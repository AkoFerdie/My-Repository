import 'package:flutter/material.dart';
import 'getting_started_page.dart';
import 'services/database_service.dart'; // import your service

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database for web/mobile/desktop
  await DatabaseService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GettingStartedPage(),
    );
  }
}
