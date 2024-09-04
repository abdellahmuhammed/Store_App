// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/Services/AllProductsServices.dart';
import 'package:store_app/Widgets/CustomCard.dart';
import 'package:store_app/Widgets/CustomText.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/Component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyHomePage(),
    );
  }

  Widget _buildBodyHomePage() {
    return FutureBuilder<List<ProductsModel>>(
      future: AllProductsServices().getAllProducts(),
      builder: (context, snapShot) {
        // if (snapShot.connectionState == ConnectionState.waiting) {
        //   log('waiting Connection State is waiting ${snapShot.error.toString()}');
        //   return CustomCircularProgressIndicator(
        //       messageLoading: 'Waiting your Connection State');
        // } else


          if (snapShot.hasData && snapShot.data!.isNotEmpty) {
          List<ProductsModel> product = snapShot.data!;
          return _buildDataLoaded(product);
        } else if (snapShot.hasError || snapShot.error == true) {
          log('oops There was an error occurred ${snapShot.error.toString()}');
          return CustomCircularProgressIndicator(
              messageLoading: 'oops There was an error occurred,try later');
        } else {
          log('unexpected error occurred ${snapShot.error.toString()}');
          return CustomCircularProgressIndicator(
              messageLoading: 'unexpected error occurred');
        }
      },
    );
  }

  Padding _buildDataLoaded(List<ProductsModel> product) {
    return Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .90,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              var productItem = product[index];
              return InkWell(

                child: CustomCard(productItem: productItem),
              );
            },
            itemCount: product.length,
          ),
        );
  }
}

class CustomAny extends StatelessWidget {
  const CustomAny({
    required this.product,
    super.key,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(.06),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              product.image,
              height: 80,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(text: product.title.substring(0, 10)),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            buildText(text: product.description),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(text: '${product.price}' r'$'),
                const Icon(Icons.add)
              ],
            )
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0.0,
    title: buildText(text: 'New Trend', fontSize: 30),
    centerTitle: true,
  );
}
