import 'package:eu/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAuthWrapper extends StatefulWidget {
  const AppAuthWrapper({super.key, required this.home});

  final Widget home;

  @override
  State<AppAuthWrapper> createState() => _AppAuthWrapperState();
}

class _AppAuthWrapperState extends State<AppAuthWrapper> {
  late Stream<User?> stream;

  @override
  void initState() {
    stream = FirebaseAuth.instance.authStateChanges(); //envía estado de inicio de sesión
    super.initState(); //estado inicial del widget
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: stream,
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user != null) {
          // El usuario está iniciado sesión
          return widget.home;
        } else {
          // No hay usuario iniciado sesión
          return const LoginScreen();
        }
      },
    );
  }
}
