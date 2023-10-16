import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoope_copy/bottom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOuteScreen extends StatefulWidget {
  const LogOuteScreen({super.key});

  @override
  State<LogOuteScreen> createState() => _LogOuteScreenState();
}

class _LogOuteScreenState extends State<LogOuteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF152744),
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
              color: Color(0xFF4BA3A3),
              width: 2,
            )),
        elevation: 4,
        backgroundColor: const Color(0xFF367591),
        centerTitle: true,
        title: const Text(
          'Log Out',
          style: TextStyle(
              color: Color(0xFF9DFDC7), fontFamily: 'IBM_Plex_Mono'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Logged in!', style: TextStyle(color: Colors.white),),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.clear();
                Get.offAll(() => const BottomNavigator());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF152744), backgroundColor: const Color(0xFF4BA3A3), textStyle: const TextStyle(fontSize: 20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: const Size(50, 50),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
