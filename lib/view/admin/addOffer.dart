// @dart=2.9

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locatio/const/Button.dart';

class AddService extends StatefulWidget {
  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  bool uploadComplet = false;
  List<XFile> imageFileList = [];
  List<String> fileName = [];
  String url;
  List<String> dowurl = [];
  bool upload = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController program = TextEditingController();

    TextEditingController prix = TextEditingController();
    TextEditingController jour = TextEditingController();
    var data = Get.arguments;

    CollectionReference offer = FirebaseFirestore.instance
        .collection('agence')
        .doc(data.id)
        .collection('offre');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(data.id),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(children: [
              TextFormField(
                controller: title,
                decoration: const InputDecoration(
                    labelText: 'titre', hintText: 'entrez un titre'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: prix,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'prix', hintText: 'entrez le prix'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: jour,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'jours', hintText: 'entrez combien de jours'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: desc,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                decoration: const InputDecoration(
                    labelText: 'description',
                    hintText: 'entrez une description'),
              ),
              TextFormField(
                controller: program,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                decoration: const InputDecoration(
                    labelText: 'program',
                    hintText: 'entrez le program du voyage'),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    _getFromGallery();
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.black,
                    child: imageFileList.isEmpty
                        ? Container(
                            color: Colors.white.withOpacity(0.3),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imageFileList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.file(File(imageFileList[index].path),
                                  fit: BoxFit.fill);
                            },
                          ),
                  ),
                ),
              ),
              
              const SizedBox(height: 10,),
              MyButton(
                text: 'upload',
                function: () async {
                  String id = offer.doc().id;
                  if (dowurl.isEmpty ||
                      title.text == null ||
                      desc.text == null ||
                      program.text == null) {
                    Get.snackbar("invalid data", '');
                  } else {
                    try {
                      await offer.doc(id).set({
                        'title': title.text,
                        'desc': desc.text,
                        'image': dowurl,
                        'program': program.text,
                        'id': id,
                        'price': double.parse(prix.text),
                        'agence_id': data['title'],
                      }).whenComplete(() {
                        Get.snackbar("uploaded", '');
                      desc.clear();
                      title.clear();
                      prix.clear();
                      setState(() {
                        imageFileList = [];
                      });
                      }  );
                     
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    TaskSnapshot uploadTask;
    List<XFile> pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile.isNotEmpty) {
      setState(() {
        imageFileList.addAll(pickedFile);
      });

      for (var i = 0; i < imageFileList.length; i++) {
        fileName.add(imageFileList[i].path.split("/").last);

        uploadTask = await FirebaseStorage.instance
            .ref('service/${fileName[i]}')
            .putFile(
              File(imageFileList[i].path),
            )
            .whenComplete(() {
          upload = true;
          Get.snackbar('uploaded an item', '',
              snackPosition: SnackPosition.BOTTOM);
        });

        String url = await uploadTask.ref.getDownloadURL();

        dowurl.add(url);
      }
    }
  }
}
