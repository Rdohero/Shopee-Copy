import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buttonSetting(Widget page,String text) {
  return ElevatedButton(
    onPressed: () {
      Get.to(() => page);
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 47),
      elevation: 0,
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF212121)),
          ),
        ),
        const Icon(Icons.navigate_next, color: Colors.black,),
      ],
    ),
  );
}

Widget profileButton(Widget page, IconData icon, Color iconcolor,String text) {
  return GestureDetector(
    onTap: () {
      Get.to(() => page);
    },
    child: Container(
      width: double.infinity,
      height: 50,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(icon, color: iconcolor,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  const Icon(Icons.navigate_next,color: Colors.grey,),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buttonSettingSecurity(Widget page,String text) {
  return ElevatedButton(
    onPressed: () {
      Get.to((page));
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 47),
      elevation: 0,
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF868686)),
          ),
        ),
        const Icon(Icons.navigate_next, color: Color(0xFF868686),),
      ],
    ),
  );
}

Widget buttonApi(Widget page,String text,String text2) {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          Get.to(() => page);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 47),
          elevation: 0,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text2,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF868686)),
              ),
            ),
            Row(
              children: [
                Text(text,
                    style: const TextStyle(color: Color(0xFF868686))),
                const Icon(Icons.navigate_next,
                    color: Color(0xFF868686)),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

