import 'package:flutter/material.dart';
import 'package:store_app/Screens/HomePage.dart';

void main(List<String> args) {
  runApp( const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false
      ),
      routes: {
        HomePage.id:(context)=>const HomePage(), 
      },
      initialRoute: HomePage.id,
    );
  }
}
