import 'package:exam_flutter/pages/components/event_cards.dart';
import 'package:exam_flutter/pages/login.dart';
import 'package:exam_flutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> signOut() async {
    await AuthService().logout();
    if (!mounted) return;
    Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // TODO: UNCOMMENT
          // if (!snapshot.hasData) {
          //   return const LoginScreen();
          // }

          return Scaffold(
            body: Center(
              child: SizedBox(
                  width: screenWidth > 1520
                      ? 0.5 * screenWidth
                      : 0.9 * screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'UniVents',
                              style: TextStyle(fontSize: 32),
                            ),
                            ShadButton.outline(
                              onPressed: signOut,
                              icon: const FaIcon(FontAwesomeIcons.doorOpen),
                              child: const Text('Sign out'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const EventCards()
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}
