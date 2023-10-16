import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoope_copy/Account/profile.dart';
import 'package:shoope_copy/Widget/button_setting.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({super.key});

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFEE4D2D),),
          onPressed: () {
            Get.back();
          },
        ),
        shadowColor: Colors.white,
        elevation: 3,
        backgroundColor: Colors.white,
        title: const Text(
          'Akun dan Keamanan',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          buttonSettingSecurity(
              const ProfileUser(),
              "Profil Saya"
          ),
          buttonSettingSecurity(
            const ProfileUser(),
            "Email",
          ),
          buttonSettingSecurity(
            const ProfileUser(),
            "Ganti Password",
          ),
        ],
      ),
    );
  }
}
