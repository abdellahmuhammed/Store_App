// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:store_app/Widgets/CustomMaterialButton.dart';
import 'package:store_app/Widgets/CustomText.dart';
import 'package:store_app/models/ProductsModel.dart';

class DetailsProductPage extends StatefulWidget {
  const DetailsProductPage({super.key});

  static const String id = 'DetailsProductPage';

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final ProductsModel productsModel =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;

    return Scaffold(
      appBar: AppBar(),
      body: _buildDetailsBody(productsModel, context),
    );
  }

  Padding _buildDetailsBody(ProductsModel productsModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              productsModel.image,
              height: MediaQuery.of(context).size.height * 0.30,
            ),
          ),
          const SizedBox(height: 10),
          buildText(text: productsModel.title, fontWeight: FontWeight.bold),
          _buildPriceRow(productsModel),
          buildText(
              text: productsModel.description,
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.grey),
          const SizedBox(height: 10),
          _buildRatingRow(productsModel),
          const Spacer(),
          CustomMaterialButton(
            text: 'Add to cart',
            color: Colors.blueGrey,
            height: 60,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _incrementQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity -= 1;
      }
    });
  }

  Widget _buildPriceRow(ProductsModel productsModel) {
    return Row(
      children: [
        buildText(
            text: productsModel.price.toString() + ' \$',
            color: Colors.blueGrey,
            fontSize: 30),
        const Spacer(),
        IconButton(
          onPressed: _incrementQuantity,
          icon: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        buildText(
          text: '$quantity',
        ),
        IconButton(
          onPressed: _decrementQuantity,
          icon: const Icon(
            Icons.remove,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingRow(ProductsModel productsModel) {
    return Row(
      children: [
        buildText(text: '${productsModel.rating!.rate} ⭐ ', fontSize: 30),
        const SizedBox(width: 10),
        buildText(
            text: '(Count: ${productsModel.rating!.count} available)',
            color: Colors.grey,
            fontWeight: FontWeight.normal)
      ],
    );
  }
}
