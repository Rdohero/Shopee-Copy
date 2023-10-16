import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoope_copy/Account/account_security.dart';
import 'package:shoope_copy/Widget/button_setting.dart';
import 'package:shoope_copy/bottom_navigator.dart';
import 'package:shoope_copy/login_screen.dart';

class SettingAccount extends StatefulWidget {
  const SettingAccount({super.key});

  @override
  State<SettingAccount> createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
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
          'Pengaturan Akun',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/Images/chat.png"),
              color: Color(0xFFEF4D29),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: const Color(0xFFF5F5F5),
              child: const Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text("Akun Saya",style: TextStyle(fontSize: 11.5,color: Color(0xff717171),),),
              ),
            ),
            buttonSetting(
              const AccountSecurity(),
              "Keamanan & Akun"
            ),
            buttonSetting(
              const LoginScreen(),
              "Alamat Saya"
            ),
            buttonSetting(
              const LoginScreen(),
              "Kartu / Rekening Bank"
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: const Color(0xFFF5F5F5),
              child: const Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text("Pengaturan",style: TextStyle(fontSize: 11.5,color: Color(0xff717171),),),
              ),
            ),
            buttonSetting(
                const LoginScreen(),
                "Pengaturan Chat"
            ),
            buttonSetting(
                const LoginScreen(),
                "Pengaturan Notifikasi"
            ),
            buttonSetting(
                const LoginScreen(),
                "Pengaturan Privasi"
            ),
            buttonSetting(
                const LoginScreen(),
                "Pengguna Diblokir"
            ),
            buttonSetting(
                const LoginScreen(),
                "Bahasa / Language"
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: const Color(0xFFF5F5F5),
              child: const Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text("Bantuan",style: TextStyle(fontSize: 11.5,color: Color(0xff717171),),),
              ),
            ),
            buttonSetting(
                const LoginScreen(),
                "Pusat Bantuan"
            ),
            buttonSetting(
                const LoginScreen(),
                "Peraturan Komunitas"
            ),
            buttonSetting(
                const LoginScreen(),
                "Kebijakan Shopee"
            ),
            buttonSetting(
                const LoginScreen(),
                "Suka Shopee? Nilai Kami"
            ),
            buttonSetting(
                const LoginScreen(),
                "Informasi"
            ),
            buttonSetting(
                const LoginScreen(),
                "Ajukan Penghapusan Akun"
            ),
            Container(
              width: double.infinity,
              height: 160,
              color: const Color(0xFFF5F5F5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 35,right: 35),
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 45),
                        foregroundColor: Colors.transparent, backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                        elevation: 0,
                        side: const BorderSide(
                          color: Color(0xFF212121),
                          width: 1.0,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Ganti Akun",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF212121)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7,left: 35,right: 35),
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        await pref.clear();
                        Get.offAll(() => const BottomNavigator());
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 45),
                        foregroundColor: Colors.transparent, backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                        elevation: 0,
                        side: const BorderSide(
                          color: Color(0xFF212121),
                          width: 1.0,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF212121)),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text("Shopee v 3.09.20",style: TextStyle(fontSize: 12),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
