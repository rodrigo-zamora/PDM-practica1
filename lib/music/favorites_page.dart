// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, prefer_const_constructors, unused_local_variable, unnecessary_import, prefer_const_literals_to_create_immutables, sort_child_properties_last, depend_on_referenced_packages, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis favoritos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image(
                                  image: NetworkImage(
                                    'https://i.scdn.co/image/ab67616d00001e02fc915b69600dce2991a61f13',
                                  ),
                                  width: 250,
                                ),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 400,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(148, 33, 92, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Symphony",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Imagine Dragons",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
