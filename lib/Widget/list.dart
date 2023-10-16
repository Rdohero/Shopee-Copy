import 'package:flutter/material.dart';

Widget listShopee(String image, String text, Color color) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 23),
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(image),
              color: color,
              size: 30,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          width: 70,
          height: 30,
          child: Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}