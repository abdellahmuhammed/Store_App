import 'package:flutter/material.dart';
import 'package:store_app/Screens/DeitalsProduct.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/shared/Component.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    super.key,
    required this.productItem,
  });

  final ProductsModel productItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 3,
                color: Colors.grey.withOpacity(.1),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextTitle(text: productItem.title),
                     GestureDetector(
                       onTap: (){
                       //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('for test')));
                       },
                       child: const Icon(
                         Icons.favorite,
                         color: Colors.red,
                       ),
                     )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailsProductPage.id,
                          arguments: productItem);
                    },
                    child: customTextSubTitle(text: productItem.description),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextTitle(text: '${productItem.price}' r' $'),
                      const SizedBox(
                        width: 10,
                      ),
                      customTextSubTitle(text: '${productItem.rating!.rate} ⭐'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width *.08,
            bottom: 85,
            child: Image(
                height: 100,
                width: 120,
                image: NetworkImage(productItem.image))),
      ],
    );
  }
}
