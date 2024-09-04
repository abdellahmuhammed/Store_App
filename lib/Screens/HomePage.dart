import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Screens/UpdateProduct.dart';
import 'package:store_app/Services/AllProductsServices.dart';
import 'package:store_app/Widgets/CustomCard.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/Component.dart';
import 'package:store_app/shared/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _buildBodyHomePage(),
    );
  }
}

Widget _buildBodyHomePage() {
  return FutureBuilder<List<ProductsModel>>(
    future: AllProductsServices().getAllProducts(),
    builder: (context, snapShot) {
      if (snapShot.connectionState == ConnectionState.waiting) {
        log('Connection State is waiting ${snapShot.connectionState}');
        return CustomCircularProgressIndicator(
            messageLoading: 'Connection State is waiting');
      } else if (snapShot.hasData && snapShot.data!.isNotEmpty) {
        List<ProductsModel> product = snapShot.data!;
        return _buildDataLoaded(product);
      } else if (snapShot.hasError || snapShot.error != null) {
        log('oops There was Error${snapShot.error.toString()}');
        return CustomCircularProgressIndicator(
            messageLoading: 'oops There was an Error');
      } else {
        log('oops There was an Expected Error ${snapShot.error.toString()}');
        return CustomCircularProgressIndicator(
            messageLoading: 'oops There was an Expected Error');
      }
    },
  );
}

Widget _buildDataLoaded(List<ProductsModel> product) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: GridView.builder(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30),
      itemBuilder: (context, index) {
        var productItem = product[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, UpdateProductPage.id,
                arguments: productItem);
          },
          child: CustomCard(productItem: productItem),
        );
      },
      itemCount: product.length,
    ),
  );
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: customTextTitle(text: 'NewTrend'),
    centerTitle: true,
  );
}
