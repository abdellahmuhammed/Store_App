// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customTextTitle({required String text}) => Text(
      text,
      style: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    );

Widget customTextSubTitle({required String text}) => Text(
      text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
    );

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
          left: MediaQuery.of(context).size.width * .22,
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
