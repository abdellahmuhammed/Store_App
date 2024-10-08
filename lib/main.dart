import 'package:flutter/material.dart';
import 'package:store_app/Screens/DeitalsProduct.dart';
import 'package:store_app/Screens/HomePage.dart';
import 'package:store_app/Screens/UpdateProduct.dart';

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
        primarySwatch: Colors.blueGrey,

        useMaterial3: false
      ),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        UpdateProductPage.id : (context)=> UpdateProductPage(),
        DetailsProductPage.id : (context)=> DetailsProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
