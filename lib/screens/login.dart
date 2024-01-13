import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: size.height * 0.4,
            child: const EULogo(),
          ),
          Positioned(
            top: size.height * 0.2,
            left: 0,
            right: 0,
            bottom: 0,
            child: const LoginButton(),
          )
        ],
      ),
    );
  }
}

class EULogo extends StatelessWidget {
  const EULogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("EU"),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: Image.asset(
          'assets/google_logo.png',
          width: 30,
        ),
        onPressed: () {
          FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
        },
        label: const Text("Iniciar sesión con Google"),
      ),
    );
  }
}
