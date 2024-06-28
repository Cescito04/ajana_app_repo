import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/aPropos.page.dart';
import 'package:myfirstapp/pages/accueil.page.dart';
import 'package:myfirstapp/pages/actualites.page.dart';
import 'package:myfirstapp/pages/boutique.page.dart';
import 'package:myfirstapp/pages/chat.page.dart';
import 'package:myfirstapp/pages/counter.page.dart';
import 'package:myfirstapp/pages/dons.page.dart';
import 'package:myfirstapp/pages/home.page.dart';
import 'package:myfirstapp/pages/jaayante.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => AccueilPage(),
        "/actualites": (context) => ActualitePage(),
        "/boutique": (context) => BoutiquePage(),
        "/dons": (context) => DonPage(),
        "/a_propos": (context) => AproposPage(),
        "/jaayante": (context) => JaayantePage(),
        "/counter": (context) => CounterPage(),
        "/chat": (context) => ChatPage(),
      },
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
            fontSize: 22,
          )),
          indicatorColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            primary: Color.fromARGB(255, 89, 119, 70),
          )),
    );
  }
}
