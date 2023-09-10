import 'package:flutter/material.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountSScreenState();
}

class _AccountSScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: buildScreen(),
    );
  }


  Widget buildScreen() {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Notification"),
      ),
      body: Container(
        height: double.infinity,
        decoration:const BoxDecoration(),
        child:const Center(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
      ),
    );
  }
}