import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/view/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.blueGrey,
          contentTextStyle: TextStyle(color: Colors.white),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.inter(
            color: const Color(0xFF24675B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF24675B),
            textStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
