import 'package:flutter/material.dart';
import 'package:tripbudgeter/pages/bookingpage.dart';
import 'package:tripbudgeter/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUDGET APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
        
      ),
      home:  BookingPage(),
    );
  }
}
