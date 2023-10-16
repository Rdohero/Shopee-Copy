import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoope_copy/bottom_navigator.dart';
import 'package:shoope_copy/daftar_screen.dart';
import 'package:shoope_copy/Api/login_register_api.dart';


import 'Widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isButtonEnabled() {
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  Future<void> login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final response = await Api.loginUser(email, password);

    if (response.statusCode == 200) {
      final token = Api.tok1;
      final id = Api.id;
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("Token", token);
      sharedPreferences.setInt("ID", id);
      Get.off(() => const BottomNavigator());
    } else {
      final error = Api.eror2;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
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
            'Log In',
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
                login(context)
              } : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: isButtonEnabled() ? const Color(0xFFEE4D2D) : Colors.grey, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                minimumSize: Size(screenWidth * 0.8, screenHeight * 0.05),
              ),
              child: Text(
                'Log In',
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
              const Text("Belum punya akun?"),
              TextButton(
                onPressed: () {
                  Get.off(() => const DaftarScreen());
                },
                child: const Text(
                  "Daftar",
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
