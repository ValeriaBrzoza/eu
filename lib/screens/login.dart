import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//pantalla si no hay un inicio de sesion

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      //para que la screen sea pantalla completa
      backgroundColor: theme.primaryColor,
      body: Stack(
        children: [
          Positioned(
            //logo de eu acomodado
            top: 0,
            left: 0,
            right: 0,
            bottom: size.height * 0.4,
            child: const EULogo(),
          ),
          Positioned(
            //boton de inicio de sesion acomodado
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
  //logo de eu
  const EULogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Eu!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 80,
          fontFamily: 'Jua',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  //boton de inicio de sesion
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: Image.asset(
          //logo de google
          'assets/google_logo.png',
          width: 45,
        ),
        onPressed: () {
          //el boton llama a firebase para iniciar sesion con google
          if (kIsWeb) {
            FirebaseAuth.instance.signInWithRedirect(GoogleAuthProvider()); //redirect para web
          } else {
            FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider()); //provider para mobile
          }
        },
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            //texto del boton
            "Iniciar sesión con Google",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
