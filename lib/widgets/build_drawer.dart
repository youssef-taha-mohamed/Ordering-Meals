import 'package:flutter/material.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      width: 150,
    );
  }
}
