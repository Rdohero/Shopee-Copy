import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoope_copy/Widget/text_field_widget.dart';

class UbahPass extends StatefulWidget {
  const UbahPass({super.key});

  @override
  State<UbahPass> createState() => _UbahPassState();
}

class _UbahPassState extends State<UbahPass> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  bool isButtonEnabled() {
    return passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFEE4D2D),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        shadowColor: Colors.white,
        elevation: 3,
        backgroundColor: Colors.white,
        title: const Text(
          'Verify by Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          myTextField(
              passwordController,
              'Password',
              true,
              TextInputType.text,
              Icons.lock
          ),
          ElevatedButton(
            onPressed: isButtonEnabled() ? () => {
            } : null,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: isButtonEnabled() ? const Color(0xFFEE4D2D) : Colors.grey, shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
              minimumSize: Size(screenWidth * 0.8, screenHeight * 0.05),
            ),
            child: Text(
              'Ok',
              style: TextStyle(
                fontSize: 15,
                color: isButtonEnabled() ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
