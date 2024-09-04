import 'package:flutter/material.dart';
import 'package:store_app/Screens/DeitalsProduct.dart';
import 'package:store_app/Widgets/CustomText.dart';
import 'package:store_app/models/ProductsModel.dart';

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
                      buildText(text: productItem.title.substring(0 , 15) , fontSize: 18 , maxLines: 1),
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
                          arguments: productItem,);
                    },
                    child: buildText(text: productItem.description ,overflow:TextOverflow.ellipsis, fontSize: 15 , maxLines: 2 , fontWeight: FontWeight.normal , color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(text: '${productItem.price}' r' $' , fontSize: 18),
                      const SizedBox(
                        width: 10,
                      ),
                      buildText(text: '${productItem.rating!.rate} ⭐' , fontSize: 18),
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
