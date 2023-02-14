// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: const Color(0xFFDEDEDE),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            data.title,
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            
              const Padding(
                padding: EdgeInsets.only(left:20.0,top: 20,bottom: 10),
                child: Text(
                  'Nos Offres',
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),


              FutureBuilder(
                future: FirebaseFirestore.instance.collectionGroup('offre').get(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == true) {
                    final List<DocumentSnapshot> documents = snapshot.data.docs;

                    return Expanded(
                      child: ListView(
                          children: documents
                              .map((doc) => doc['agence_id'] == data.title
                                  ? SizedBox(
                                    height: 130,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(23),
                                      child: Card(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(doc['image'][0],height: 130,width: 200,fit: BoxFit.fill,),
                                            const SizedBox(width: 20,),
                                            Column(
                                              mainAxisAlignment:MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 10,),
                                                Text(
                                                    doc['title'],
                                                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                                  ),
                                                  Row(children: const [
                                                    Icon(Icons.star,color: Colors.yellow,),
                                                    Text('4.5')
                                                  ],)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ))
                              .toList()),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(color: Colors.red,));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
