// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget customTextTitle({required String text}) {
  return Text(
    refactorTitle(title: text),
    maxLines: 1,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

Widget customTextSubTitle({required String text}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
        fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey),
  );
}

String refactorTitle({required String title}) {
  List<String> words = title.split(' ');
  if (words.length > 1) {
    return '${words[0]} ';
  } else {
    return title;
  }
}

Widget CustomCircularProgressIndicator({required String messageLoading}) {
  return Padding(
    padding: EdgeInsets.only(left: 65),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 20,
        ),
        Text(
          messageLoading,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    ),
  );
}
