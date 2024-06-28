import 'package:flutter/material.dart';

class MyDrawerItem extends StatelessWidget {
  final String title;
  final Icon itemIcon;
  final String route;

  MyDrawerItem(
      {super.key,
      required this.title,
      required this.itemIcon,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: itemIcon,
      title: Text("$title",style: TextStyle(fontWeight: FontWeight.w300),),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
    );
  }
}
