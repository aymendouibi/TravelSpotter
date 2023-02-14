// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locatio/const/firebase.dart';
import 'package:locatio/view/admin/adminPage.dart';

class MyAdmin extends StatelessWidget {
  const MyAdmin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('agence')
            .where('admin', isEqualTo: auth.currentUser.email)
            .get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == true) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
    
            return SizedBox(
              width: double.infinity,
              height:Get.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                    children: documents
                        .map((doc) => InkWell(
                              onTap: () {
                                print(doc.id);
                                Get.to(AdminPage(),arguments: doc);
                              },
                              child: SizedBox(
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Card(
                                    elevation: 2,
                                    child: Row(children: [
                                      Image.network(
                                        doc['image'],
                                        fit: BoxFit.fitHeight,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        doc['title'],
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ))
                        .toList()),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
