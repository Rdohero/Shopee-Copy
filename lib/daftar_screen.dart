import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoope_copy/login_screen.dart';

import 'Api/login_register_api.dart';
import 'Widget/text_field_widget.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({super.key});

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register(BuildContext context) async {
    final fullname = fullnameController.text;
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    final response = await Api.registerUser(fullname, username, email, password);

    if (response.statusCode == 200) {
      Get.off(const LoginScreen());
      final error = Api.tok;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    } else {
      final error = Api.eror;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text(error)),
      );
    }
  }

  bool isButtonEnabled() {
    return fullnameController.text.isNotEmpty && usernameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFEE4D2D),),
            onPressed: () {
              Get.back();
            },
          ),
          shadowColor: Colors.white,
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text(
            'Daftar',
            style:
            TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/Images/logo_shopee.png"),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                myTextField(
                    fullnameController,
                    'Full Name',
                    false,
                    TextInputType.text,
                    Icons.person
                ),
                myTextField(
                    usernameController,
                    'Username',
                    false,
                    TextInputType.text,
                    Icons.person
                ),
                myTextField(
                    emailController,
                    'Email',
                    false,
                    TextInputType.emailAddress,
                    Icons.email
                ),
                myTextField(
                    passwordController,
                    'Password',
                    true,
                    TextInputType.emailAddress,
                    Icons.lock
                ),
              ],
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: isButtonEnabled() ? () => {
                register(context)
              } : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: isButtonEnabled() ? const Color(0xFFEE4D2D) : Colors.grey, shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
                minimumSize: Size(screenWidth * 0.8, screenHeight * 0.05),
              ),
              child: Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 15,
                  color: isButtonEnabled() ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sudah punya akun?"),
              TextButton(
                onPressed: () {
                  Get.off(() => const LoginScreen());
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
