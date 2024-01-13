# eu

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Pasos de configuración

- Instalar/Actualizar flutter
- Crear proyecto nuevo y hacer un commit inicial
- [Confugurar firebase](https://firebase.google.com/docs/flutter/setup?hl=es&platform=web#available-plugins)
  - Instalar firebase CLI
  - Iniciar sesión en firebase: `firebase login`
  - Instalar flutterfire: `dart pub global activate flutterfire_cli`
  - Confugurar el proyecto en firebase: `flutterfire configure`
  - Instalar firebase_core: `flutter pub add firebase_core`
- Hacer un commit con firebase funcionando

## Depuración inalámbrica en Android

- En opaciones de desarrollador, activar la depuración inalámbrica.
- Tener instalado Android Studio y sdk de Android
- En la computadora, ejecutar `adb pair <ip>:<puerto>`, ingresar código
- Ejecutar la app con `flutter run`