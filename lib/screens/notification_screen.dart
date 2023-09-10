import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          Icons.notification_add,
          size: 40,
        ),
      ),
    ),
  );
}
}