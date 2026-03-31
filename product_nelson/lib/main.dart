import 'package:flutter/material.dart';
import 'package:product_nelson/screens/home_page.dart';

void main() => runApp(const MainApp());


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
    Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      title: 'product_Nelson', 
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), 
        useMaterial3: true, 
      ), 
    home: HomePage(), 
    ); 
  } 
} 
