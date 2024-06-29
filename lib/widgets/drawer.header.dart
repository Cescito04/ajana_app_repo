import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/img2.png"),
            radius: 60,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
          gradient: LinearGradient(
        colors: [
         // Colors.white,
          Theme.of(context).primaryColor,
        ],
      )),
    );
  }
}
