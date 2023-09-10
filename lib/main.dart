import '../widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.grey[400],
        appBarTheme: AppBarTheme(
            //backwardsCompatibility: false,
            backgroundColor: Colors.grey[400],
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.grey[400],
              statusBarIconBrightness: Brightness.dark,
            ),
            elevation: 0.0,
            titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            iconTheme: const IconThemeData(color: Colors.black)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            elevation: 20.0),
        primarySwatch: Colors.deepOrange,
      ),
      home: const BottomNavBar(),
    );
  }
}
