// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          physics:const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, indwex) => const CustomCard(),
          itemCount: 10,
        ),
      ),
    );
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
}
