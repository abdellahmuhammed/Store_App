// ignore_for_file: must_be_immutable, file_names, avoid_print


import 'package:flutter/material.dart';
import 'package:store_app/Services/UpdateProductServices.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/Component/CustomTextFormField.dart';
import 'package:store_app/shared/Component/jdfd.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});
  static String id = 'Update Page';
  String? productName, description, price, image;

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      appBar: AppBar(),
      body: buildUpdateProduct(product),
    );
  }

  Padding buildUpdateProduct(ProductsModel product) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          CustomTextFormField(
            label: 'Enter Product Name',
            onFieldSubmitted: (value) {
              productName = value;
              print(value);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
              label: 'Enter Product description',
              onFieldSubmitted: (value) {
                description = value;
              }),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
              label: 'Enter Product pric',
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                price = value;
              }),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
              label: 'Enter image link',
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value) {
                image = value;
              }),
          const SizedBox(
            height: 40,
          ),
          CustomMaterialButton(
            text: 'Update',
            onTap: () async {
              await updateProduct(product);
              print('Seccssefully');
            },
          )
        ],
      ),
    );
  }

  Future<void> updateProduct(ProductsModel product) async {
    await UpdateProductServices().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
