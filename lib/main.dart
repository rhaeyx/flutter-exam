import 'package:exam_flutter/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/dashboard.dart';
import 'pages/login.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
        title: 'UniVents',
        darkTheme: ShadThemeData(
          brightness: Brightness.dark,
          colorScheme: const ShadNeutralColorScheme.dark(),
        ),
        routes: {
          '/': (context) => const LoginScreen(),
          '/dashboard': (context) => const DashboardScreen(),
          // '/create': (context) => CreateScreen(),
          // '/edit': (context) => EditScreen(),
          // '/list': (context) => ListScreen(),
        });
  }
}
