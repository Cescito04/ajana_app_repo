import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/widgets/custom.drawer.widget.dart';

class ActualitePage extends StatelessWidget {
  const ActualitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyCustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Actualités",
          style: TextStyle(color: Theme.of(context).indicatorColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text(
          "Actualités PAGE",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
