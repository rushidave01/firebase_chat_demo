import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_demo/pages/home_page.dart';
import 'package:firebase_chat_demo/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';

class Authgate extends StatefulWidget {
  const Authgate({super.key});

  @override
  State<Authgate> createState() => _AuthgateState();
}

class _AuthgateState extends State<Authgate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
