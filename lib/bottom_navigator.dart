import 'package:flutter/material.dart';
import 'package:shoope_copy/home.dart';
import 'package:shoope_copy/profile.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _index = 0;

  final screens = [
    const Home(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFEE4D2D),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                "assets/Images/people.png",
              ),
            ),
            label: "Saya",
          ),
        ],
      ),
      body: screens[_index],
    );
  }
}