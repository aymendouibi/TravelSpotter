// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:locatio/const/Button.dart';
import 'package:locatio/const/TextSpan.dart';
import 'package:locatio/const/rating.dart';
import 'package:locatio/view/offers.dart';

import '../model/agence.dart';

class AgenceController extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  Set<Marker> markers = {};

  final List<AgenceModel> AgenceList = [];
  List<AgenceModel> get getAgenceList => AgenceList;
  final agence = FirebaseFirestore.instance.collection("agence");

  AgenceController() {
    getAgence();
  }
  getAgence() async {
    _loading.value = true;
    await agence.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        AgenceList.add(AgenceModel.fromJson(value.docs[i].data()));
        _loading.value = false;
      }
      update();
      AgenceList.shuffle();
    }).then((value) {
      for (int i = 0; i < AgenceList.length; i++) {
        markers
            .addLabelMarker(LabelMarker(
                label: AgenceList[i].title,
                markerId: MarkerId(AgenceList[i].title),
                position: LatLng(
                    AgenceList[i].LL.latitude, AgenceList[i].LL.longitude),
                backgroundColor: Colors.red,
                onTap: () {
                  Get.bottomSheet(ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(49),
                        topRight: Radius.circular(49)),
                    child: Container(
                        height: Get.height * 0.5,
                        color: Colors.white,
                        width: Get.width,
                        child: Column(
                          children: [
                            //profil

                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, left: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.17,
                                    width: Get.height * 0.17,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          NetworkImage(AgenceList[i].image),
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AgenceList[i].title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        MyTextSpan(
                                          text1: "Email",
                                          text2: AgenceList[i].email,
                                        ),
                                        MyTextSpan(
                                          text1: "Number",
                                          text2:
                                              AgenceList[i].number.toString(),
                                        ),
                                        MyTextSpan(
                                          text1: "Wilaya",
                                          text2: AgenceList[i].wilaya,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyRating(
                              rating: 4,
                              onRated: null,
                              isReadOnly: true,
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: MyButton(
                                text: 'Contacter',
                                function: () {
                                  Get.to(MyOffer(),arguments: AgenceList[i]);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                            //
                          ],
                        )),
                  ));
                }))
            .then(
          (value) {
            update();
          },
        );
      }
    });
  }
}
