import 'package:exam_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _login() async {
    AuthService().loginWithGoogle().then((String response) {
      {
        if (response.contains('success')) response = 'Login successful.';

        if (!mounted) return;
        ShadToaster.of(context).show(
          ShadToast(
            description: Text(response),
          ),
        );

        Navigator.of(context).pushNamed('/dashboard');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
        body: Center(
            child: ShadCard(
      width: 350,
      title: Text('UniVents', style: theme.textTheme.h1),
      description:
          const Text('A one stop shop for all events in the university.'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShadButton(
              onPressed: _login,
              icon: const FaIcon(FontAwesomeIcons.google),
              child: const Text('Login with Google'),
            ),
          ],
        ),
      ),
    )));
  }
}
