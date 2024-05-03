import 'package:flutter/material.dart';
import 'package:re_exam1/Screens/DetailScreen.dart';
import 'package:re_exam1/Screens/HomeScreen.dart';

import 'Screens/CartScreen.dart';
import 'Screens/CheckOut.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>HomePage(),
        '/home':(context)=>HomePage(),
        '/detail':(context)=>DetailScreen(),
        '/cart':(context)=>CartScreen(),
        '/check':(context)=>CheckOut(),
      },
    );
  }
}
