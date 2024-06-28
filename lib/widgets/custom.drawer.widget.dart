import 'package:flutter/material.dart';
import 'package:myfirstapp/widgets/drawer.header.dart';
import 'package:myfirstapp/widgets/drawer.item.dart';

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
              color:Color.fromARGB(255, 89, 119, 70),
            child: Image.asset('images/img2.png'),

          ),

          SizedBox(height: 10,),
         // CustomDrawerHeader(),
          MyDrawerItem(
            title: "Accueil",
            itemIcon: Icon(Icons.home, color: Theme.of(context).primaryColor),
            route: "/",
          ),
          Divider(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
          MyDrawerItem(
            title: "Actualités",
            itemIcon:
                Icon(Icons.newspaper, color: Theme.of(context).primaryColor),
            route: "/actualites",
          ),
          Divider(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
          MyDrawerItem(
            title: "Boutiques",
            itemIcon: Icon(Icons.money, color: Theme.of(context).primaryColor),
            route: "/boutique",
          ),
          Divider(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
          MyDrawerItem(
            title: "Dons",
            itemIcon: Icon(Icons.card_giftcard,
                color: Theme.of(context).primaryColor),
            route: "/dons",
          ),
          Divider(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
          MyDrawerItem(
            title: "Jaayanté",
            itemIcon:
                Icon(Icons.credit_card, color: Theme.of(context).primaryColor),
            route: "/jaayante",
          ),
          Divider(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
          MyDrawerItem(
            title: "A propos",
            itemIcon: Icon(Icons.info, color: Theme.of(context).primaryColor),
            route: "/a_propos",
          ),
          Divider(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
