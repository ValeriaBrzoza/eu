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

## Implementación de características

- [Autenticación con firebase](https://firebase.google.com/docs/auth/flutter/start?hl=es): 
  - **IMPORTANTE**: Activar la autenticación con Google en la consola de firebase
  - **IMPORTANTE**: Agregar la "huella digital" (hash SHA) a la app de android en la consola de firebase

## Obtener SHA de firma de app

### En Mac
  - Con terminal: `keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`

### En windows
  - Con CMD: `keytool -list -v -keystore %USERPROFILE%/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`
  - Con PowerShell: `.\keytool -list -v -keystore $env:USERPROFILE/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`

### Donde encontrar el programa de keytool en Windows
  Posibles ubicaciones:

  - C:\Program Files\Android\Android Studio\jbr\bin
  - C:\Program Files\Android\Android Studio\jre\bin
  - C:\Program Files\Java\jdk-19\bin
  - C:\Program Files\Java\jdk-VERSION\bin