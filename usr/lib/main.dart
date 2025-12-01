import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/home_screen.dart';

void main() {
  runApp(const CryptoNightApp());
}

class CryptoNightApp extends StatelessWidget {
  const CryptoNightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoNight',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue.shade900,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        cardColor: const Color(0xFF1A1A1A),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white70),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A1A1A),
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
