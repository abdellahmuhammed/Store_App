// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:store_app/models/ProductsModel.dart';

class DetailsProductPage extends StatelessWidget {
   DetailsProductPage({super.key});

  static String id = 'DetailsProductPage';

  int number = 0;
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image.network(
              productsModel.image,
              height: MediaQuery.of(context).size.height * .35,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              productsModel.title,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '${productsModel.price}' r'%',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                const Spacer(),
                IconButton(onPressed: (){
                  number =number+1;
                }, icon: Icon(Icons.add)),
                Text('$number'),
                IconButton(onPressed: (){
                  number =number-1;
                }, icon: Icon(Icons.remove)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              productsModel.description,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
