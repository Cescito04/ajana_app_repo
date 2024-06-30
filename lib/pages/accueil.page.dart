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
  List<String> infoImages = [
    'images/actu_1.jpeg',
    'images/actu_2.jpg',
    'images/actu_3.jpg',
    'images/actu_4.jpg',
  ];
  List<String> infoTitles = [
    'Les Khalifs d\'El Hadj Malick Sy (rta)',
    'Communiqué Jama’atou Nour Assouniya ',
    'VIDEO – Serigne Babacar Sy Mansour ',
    'PHOTOS ET VIDEO – Déclaration Commune ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyCustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Accueil",
          style: TextStyle(color: Theme.of(context).indicatorColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: buildHorizontalImageList(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: buildBannerImage(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: buildSectionTitleRow(
              title: 'BOUTIQUE',
              actionText: 'VOIR PLUS',
            ),
          ),
          SliverToBoxAdapter(
            child: buildProductSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: buildSectionTitleRow(
              title: 'ACTUALITÉS',
              actionText: 'VOIR PLUS',
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return buildNewsItem(index, context);
              },
              childCount: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalImageList() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 450,
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      height: 80,
      width: double.infinity,
      child: Image.asset(
        'images/banner.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildSectionTitleRow(
      {required String title, required String actionText}) {
    return Row(
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
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 89, 119, 70),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              actionText,
              style: TextStyle(
                color: Color.fromARGB(255, 89, 119, 70),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              Icons.arrow_right_rounded,
              size: 30,
              color: Color.fromARGB(255, 89, 119, 70),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildProductSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: products.map((product) {
        return buildProductCard(product);
      }).toList(),
    );
  }

  Widget buildNewsItem(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            //border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
            ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Image.asset(
                infoImages[index],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    infoTitles[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Il y a une année',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 200,
      width: 180,
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 89, 119, 70)),
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
