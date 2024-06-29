import 'package:flutter/material.dart';

import '../widgets/custom.drawer.widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyCustomDrawer(),
      appBar: AppBar(
        title: Text(
          "CONTACT",
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
            SizedBox(height: 40,),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Icon(Icons.location_on,color: Color.fromARGB(255, 89, 119, 70),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Tivaouane en face de la Grande Mosquée',style: TextStyle(
                        color: Colors.grey.shade600
                    )
                    )
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Icon(Icons.mail,color: Color.fromARGB(255, 89, 119, 70),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Contact@grandmosqueetivaouane.com',style: TextStyle(
                      color: Colors.grey.shade600
                    ),)
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Icon(Icons.phone,color: Color.fromARGB(255, 89, 119, 70),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('+221 78 461 50 50',style: TextStyle(
                        color: Colors.grey.shade600
                    ),)
                  ],
                )
              ],
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'Prenom et Nom',
                        labelStyle: TextStyle(fontSize: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer votre nom';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(fontSize: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer votre email';
                        }
                        // toDO: Valiidation Email
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(labelText: 'Votre Message',labelStyle: TextStyle(fontSize: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer votre message';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Formulaire soumis')));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 89, 119, 70),

                          ),
                          child: Center(
                            child: Text(
                              'ENVOYER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),






          ],
        ),

      ),

    );
  }
}
