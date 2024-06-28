import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfirstapp/widgets/custom.drawer.widget.dart';

import '../models/product.dart';

class AccueilPage extends StatelessWidget {
  AccueilPage({super.key});

  List<String> imagePaths = ['images/slider1.jpg', 'images/slider2.jpg'];
  final List<Product> products = [
    Product(
      name: "PIN'S OR",
      price: "25.000 CFA",
      imageUrl: 'images/pins_or.jpeg',
    ),
    Product(
      name: "PIN'S ARGENT",
      price: "5.000 CFA",
      imageUrl: 'images/pins_or.jpeg', // Mettez l'URL correct ici
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyCustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "AJANA",
            style: TextStyle(color: Theme.of(context).indicatorColor),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
            // Icon(Icons.add_shopping_cart)
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Container(
                              width: 450,
                              child: Image.asset(imagePaths[index],
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: double.infinity,
                child: Image.asset(
                  'images/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Color.fromARGB(255, 89, 119, 70),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'BOUTIQUE',
                        style: TextStyle(
                            color: Color.fromARGB(255, 89, 119, 70),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'VOIR PLUS',
                        style: TextStyle(
                            color: Color.fromARGB(255, 89, 119, 70),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(Icons.arrow_right_rounded,
                          size: 30, color: Color.fromARGB(255, 89, 119, 70))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: products.map((product) {
                  return buildProductCard(product);
                }).toList(),
              ),
            ],
          ),
        ));
  }


  Widget buildProductCard(Product product) {
    return Container(
      height: 200,
      width: 200,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 120,
              width: 200,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        product.price,
                        style: TextStyle(color: Color.fromARGB(255, 89, 119, 70)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(255, 89, 119, 70),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 28,
                  width: double.infinity,
                  color: Color.fromARGB(255, 89, 119, 70),
                  child: Center(
                    child: Text(
                      'ACHETER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
