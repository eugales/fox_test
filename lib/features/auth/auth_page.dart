import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/auth/auth_inh_widget.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static page(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return const AuthPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: FirebaseAuth.instance.currentUser,
              stream: AuthScope.of(context)?.authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                }
                return const Text('No authorized');
              },
            ),
            FilledButton(
              onPressed: () {
                FirebaseAuth.instance.signInAnonymously();
              },
              child: const Text('Login'),
            ),
            FilledButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
