import 'package:flutter/material.dart';
import 'package:todomobx/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.deepPurpleAccent,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurpleAccent,
            disabledForegroundColor: Color(0xFF818480)
                .withAlpha(110), //Colors.deepPurpleAccent.withAlpha(100),
            disabledBackgroundColor: Color(0xFFecefec),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.deepPurpleAccent),
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      home: LoginScreen(),
    );
  }
}
