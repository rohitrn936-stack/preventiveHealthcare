import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'package:web_page/pages/login_page.dart';
import 'package:web_page/pages/portal_page.dart';
import 'package:web_page/pages/register_child_page.dart';

void main() async {
  // Makes sure Flutter is fully initialized before Firebase starts.
  WidgetsFlutterBinding.ensureInitialized();

  // Connects your Flutter app to Firebase.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Starts the Flutter application.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Child Screening Portal',
      home: const RegisterChildPage(),
    );
  }
}
