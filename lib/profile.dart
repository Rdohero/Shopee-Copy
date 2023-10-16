import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoope_copy/Account/setting_account.dart';
import 'package:shoope_copy/Api/login_register_api.dart';
import 'package:shoope_copy/Api/model/user_model.dart';
import 'package:shoope_copy/Widget/button_setting.dart';
import 'package:shoope_copy/bottom_navigator.dart';
import 'package:shoope_copy/daftar_screen.dart';
import 'package:shoope_copy/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<List<User>> futureBelahKetupatHistory;

  @override
  void initState() {
    super.initState();
    futureBelahKetupatHistory = getUserByID();
    checkLogin();
  }

  late Widget login = profileUnlogin(context);
  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = await pref.getString("Token");
    if (val != null) {
      setState(() {
        login = profileLogin(context,futureBelahKetupatHistory);
      });
    } else {
      setState(() {
        login = profileUnlogin(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: login,
    );
  }
}

Widget profileUnlogin(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: const Color(0xFFEE4D2D),
          child: Padding(
            padding: const EdgeInsets.only(top: 38),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      icon: const Icon(Icons.settings, size: 27,color: Colors.white,),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      icon: const ImageIcon(AssetImage("assets/Images/cart.png"),size: 23,color: Colors.white,),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      icon: const ImageIcon(AssetImage("assets/Images/chat.png"),size: 27,color: Colors.white,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(Icons.account_circle,color: Colors.white,size: 50,),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => const LoginScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFEE4D2D), backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFFEE4D2D)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => const DaftarScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.transparent, backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                  elevation: 0,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Daftar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 40/1,
          child: Container(
            color: const Color(0xFFF5F5F5),
          ),
        ),
        profileButton(const LoginScreen(), Icons.event_note, Colors.lightBlue, "Pesanan Saya"),
        GestureDetector(
          onTap: () {
            Get.to(const LoginScreen());
          },
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ImageIcon(AssetImage("assets/Images/Images_Button/tagihan.png"), color: Color(0xFF26AA99),),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pulsa, Tagihan & Tiket"),
                        Icon(Icons.navigate_next,color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 40/1,
          child: Container(
            color: const Color(0xFFF5F5F5),
          ),
        ),
        profileButton(const LoginScreen(), Icons.star, const Color(0xFFEE4D2D), "Shopee Member"),
        profileButton(const LoginScreen(), Icons.favorite, const Color(0xFFEE4D2D), "Favorit Saya"),
        GestureDetector(
          onTap: () {
            Get.to(const LoginScreen());
          },
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ImageIcon(AssetImage("assets/Images/Images_Button/shoope_game.png"), color: Color(0xFF26AA99),),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shopee Games"),
                        Icon(Icons.navigate_next,color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        profileButton(const LoginScreen(), Icons.access_time, Colors.blueAccent, "Terakhir Dilihat"),
        profileButton(const LoginScreen(), Icons.electric_meter_outlined, const Color(0xFFEE4D2D), "Shopee Meter"),
        GestureDetector(
          onTap: () {
            Get.to(const LoginScreen());
          },
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ImageIcon(AssetImage("assets/Images/Images_Button/ongkir.png"), color: Color(0xFFEE4D2D),),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Voucher Saya"),
                        Icon(Icons.navigate_next,color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 40/1,
          child: Container(
            color: const Color(0xFFF5F5F5),
          ),
        ),
        profileButton(const LoginScreen(), Icons.manage_accounts, Colors.blueAccent, "Pengaturan Akun"),
        profileButton(const LoginScreen(), Icons.help, const Color(0xFF26AA99), "Pusat Bantuan"),
        profileButton(const LoginScreen(), Icons.emoji_people, const Color(0xFFEE4D2D), "Chat dengan Shopee"),
      ],
    ),
  );
}

Widget profileLogin(context,Future<List<User>> futureuser) {
  return FutureBuilder<List<User>>(
    future: futureuser,
      builder: (context , snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator( color: Colors.white,));
    } else if (snapshot.hasError) {
      return const Center(child: Text('Error fetching data', style: TextStyle(color: Colors.white,fontSize: 30)));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No data available', style: TextStyle(color: Colors.white,fontSize: 30)));
    } else {
      final user = snapshot.data![0];
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: const Color(0xFFEE4D2D),
              child: Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => const SettingAccount());
                          },
                          icon: const Icon(Icons.settings, size: 27,color: Colors.white,),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          icon: const ImageIcon(AssetImage("assets/Images/cart.png"),size: 23,color: Colors.white,),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          icon: const ImageIcon(AssetImage("assets/Images/chat.png"),size: 27,color: Colors.white,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(Icons.account_circle,color: Colors.white,size: 60,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.username,style: const TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
                              const Text("Pengikut 19 | Mengikuti 25",style: TextStyle(color: Colors.white,fontSize: 12),),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 40/1,
              child: Container(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            profileButton(const BottomNavigator(), Icons.event_note, Colors.lightBlue, "Pesanan Saya"),
            GestureDetector(
              onTap: () {
                Get.to(const BottomNavigator());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: ImageIcon(AssetImage("assets/Images/Images_Button/tagihan.png"), color: Color(0xFF26AA99),),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15,right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pulsa, Tagihan & Tiket"),
                            Icon(Icons.navigate_next,color: Colors.grey,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 40/1,
              child: Container(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            profileButton(const BottomNavigator(), Icons.star, const Color(0xFFEE4D2D), "Shopee Member"),
            profileButton(const BottomNavigator(), Icons.favorite, const Color(0xFFEE4D2D), "Favorit Saya"),
            GestureDetector(
              onTap: () {
                Get.to(const BottomNavigator());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: ImageIcon(AssetImage("assets/Images/Images_Button/shoope_game.png"), color: Color(0xFF26AA99),),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15,right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shopee Games"),
                            Icon(Icons.navigate_next,color: Colors.grey,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            profileButton(const BottomNavigator(), Icons.access_time, Colors.blueAccent, "Terakhir Dilihat"),
            profileButton(const BottomNavigator(), Icons.electric_meter_outlined, const Color(0xFFEE4D2D), "Shopee Meter"),
            GestureDetector(
              onTap: () {
                Get.to(const BottomNavigator());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: ImageIcon(AssetImage("assets/Images/Images_Button/ongkir.png"), color: Color(0xFFEE4D2D),),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15,right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Voucher Saya"),
                            Icon(Icons.navigate_next,color: Colors.grey,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 40/1,
              child: Container(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            profileButton(const SettingAccount(), Icons.manage_accounts, Colors.blueAccent, "Pengaturan Akun"),
            profileButton(const BottomNavigator(), Icons.help, const Color(0xFF26AA99), "Pusat Bantuan"),
            profileButton(const BottomNavigator(), Icons.emoji_people, const Color(0xFFEE4D2D), "Chat dengan Shopee"),
          ],
        ),
      );
    }
      }
  );
}
