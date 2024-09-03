// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customTextTitle({required String text}) => Text(
      refactorTitle(title: text),
      maxLines: 1,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );

Widget customTextSubTitle({required String text}) => Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey),
    );

String refactorTitle({required String title}) {
  List<String> words = title.split(' ');
  if (words.length > 1) {
    return '${words[0]} ';
  } else {
    return title;
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 3,
                color: Colors.grey.withOpacity(.2),
              ),
            ],
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextSubTitle(text: 'New Trend'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextSubTitle(text: r'$255'),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * .13,
          bottom: MediaQuery.of(context).size.height * 0.06,
          child: Image(
            height: MediaQuery.of(context).size.height * 0.12,
            image: const CachedNetworkImageProvider(
                maxWidth: 130,
                'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg'),
          ),
        ),
      ],
    );
  }
}
/*
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Services/AllProductsServices.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/Component.dart';
import 'package:store_app/shared/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: buildAppBar(),
      body: FutureBuilder<List<ProductsModel>>(
        future: AllProductsServices().getAllProducts(),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data!.isNotEmpty) {
            List<ProductsModel> product = snapShot.data!;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => CustomAny(
                  product: product[index],
                ),
                itemCount: product.length,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
              height: 10,
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
                customTextTitle(text: product.title.substring(0 , 10)),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            customTextSubTitle(text: product.description),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextSubTitle(text: '${product.price}' r'$' ),
                const Icon(Icons.add)
              ],
            )
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kWhiteColor,
    elevation: 0.0,
    title: customTextTitle(text: 'New Trend'),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.cartPlus,
          color: kIconColor,
        ),
      ),
    ],
  );
}



 */