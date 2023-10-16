import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoope_copy/Account/Ubah/ubah_nama.dart';
import 'package:shoope_copy/Api/login_register_api.dart';
import 'package:shoope_copy/Api/model/user_model.dart';
import 'package:shoope_copy/Widget/button_setting.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  late Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = getUserByID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFEE4D2D)),
          onPressed: () {
            Get.back();
          },
        ),
        shadowColor: Colors.white,
        elevation: 3,
        backgroundColor: Colors.white,
        title: const Text(
          'Ubah Profil',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final user = snapshot.data![0];

            return profile(user);
          }
        },
      ),
    );
  }
}

Widget profile(user) {
  return Column(
    children: [
      buttonApi(const UbahNama(), user.fullname, "Nama"),
      buttonApi(const ProfileUser(), user.username, "Username"),
      buttonApi(const ProfileUser(), user.email, "Email"),
    ],
  );
}