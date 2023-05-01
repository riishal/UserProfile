import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_profile/views/UsersList.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UsersList(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          // Image.asset("assets/image/user-removebg-preview.png"),
          Image.network(
              "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg?size=626&ext=jpg"),
          const Center(
            child: Text(
              "USER DATAS",
              style: TextStyle(
                  color: Color.fromARGB(255, 92, 99, 98),
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      )),
    );
  }
}
