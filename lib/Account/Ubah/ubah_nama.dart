import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoope_copy/Api/login_register_api.dart';
import 'package:shoope_copy/Api/model/user_model.dart';

class UbahNama extends StatefulWidget {
  const UbahNama({super.key});

  @override
  State<UbahNama> createState() => _UbahNamaState();
}

class _UbahNamaState extends State<UbahNama> {
  late Future<List<User>> futureUser;
  TextEditingController fullnameController = TextEditingController();
  final ControllerListUser controller = Get.put(ControllerListUser());
  bool isButtonEnabled = false;
  var user;

  @override
  void initState() {
    super.initState();
    futureUser = getUserByID();
    futureUser.then((users) {
      if (users.isNotEmpty) {
        setState(() {
          fullnameController.text = users[0].fullname;
        });
      }
    });
    fullnameController.addListener(() {
      setState(() {
        isButtonEnabled = fullnameController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
          'Ubah Nama',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Builder(
            builder: (context) {
              return TextButton(
                onPressed: isButtonEnabled
                    ? () {
                  setState(() {
                    controller.updateUserData(fullnameController.text);
                  });
                  Get.back();
                }
                    : null,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    color: isButtonEnabled
                        ? const Color(0xFFEE4D2D)
                        : Colors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 60,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 13, right: 13),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  autofocus: true,
                  controller: fullnameController,
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}