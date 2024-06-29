import 'package:flutter/material.dart';

class ActualitePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
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
    List<String> categoryImages = [
      'images/category_1.jpg',
      'images/category_2.jpg',
      'images/category_3.jpg',
      'images/category_4.jpg',
      'images/category_5.jpg',
      'images/category_6.jpg',
    ];
    List<String> categoryTitles = [
      'Actualités',
      'Communiqués ',
      'En Direct',
      'Histoire',
      'Mediathèque',
      'Non Catégorisé'
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Actualités",
            style: TextStyle(color: Theme.of(context).indicatorColor),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'Actualités',
                ),
                Tab(
                  text: 'Catégories',
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => buildNewsItem(context, index, infoImages, infoTitles),
                          childCount: infoImages.length,
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => buildCategoryItem(context, index, categoryImages, categoryTitles),
                          childCount: categoryImages.length,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewsItem(BuildContext context, int index, List<String> infoImages, List<String> infoTitles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 89, 119, 70)),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Image.asset(infoImages[index], fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
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

  Widget buildCategoryItem(BuildContext context, int index, List<String> categoryImages, List<String> categoryTitles) {
    int displayIndex = index + 1;
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 120,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(categoryImages[index], fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Text(categoryTitles[index], style: TextStyle(fontWeight: FontWeight.bold)),
              Text('$displayIndex articles', style: TextStyle(color: Colors.grey.shade600)),
            ],
          )
        ],
      ),
    );
  }


}
