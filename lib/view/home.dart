// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locatio/const/appbar.dart';
import 'package:locatio/const/drawer.dart';
import 'package:location/location.dart';

import '../controller/agenceController.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  

  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);

  GoogleMapController _controller;

  final Location _location = Location();

  void _onMapCreated(GoogleMapController cntlr) {
    _controller = cntlr;

    _location.getLocation().then((value) => _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            const CameraPosition(
                // target: LatLng(value.latitude, value.longitude), zoom: 7),
                target: LatLng(32.908104, 3.357360),
                zoom: 7),
          ),
        ));
  }

 

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: MyDrawer(),
      appBar: const MyAppBar(
        
      ),
      body: GetBuilder<AgenceController>(
        
        builder: (controller) => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            :  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 55.0),
                        child: Text(
                          "Location de nos\nAgences",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        
                        child: GoogleMap(
                            initialCameraPosition:
                                CameraPosition(target: _initialcameraposition),
                            mapType: MapType.normal,
                            onMapCreated: _onMapCreated,
                            myLocationEnabled: true,
                            compassEnabled: true,
                            gestureRecognizers: {
                              Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer(),
                              ),
                            },
                            markers: controller.markers,
                            ),
                      ),
                    ],
                  ),
      ),
    );
    
  }
}

/**
 * ListView.builder(
              itemCount: controller.getAgenceList.length,
              itemBuilder: (BuildContext context, int index) {
                var data = controller.getAgenceList[index];
               
               for(int i =0;i <controller.getAgenceList.length;i++){
markers
                    .addLabelMarker(LabelMarker(
                  label: controller.getAgenceList[index].title,
                  markerId: MarkerId(controller.getAgenceList[index].title),
                  position: LatLng(controller.getAgenceList[index].LL.latitude,
                      controller.getAgenceList[index].LL.longitude),
                  backgroundColor: Colors.green,
                ))
                    .then(
                  (value) {
                    setState(() {});
                  },
                );
                }
                

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 55.0),
                      child: Text(
                        "Location de nos\nAgences",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: _initialcameraposition),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: true,
                          compassEnabled: true,
                          gestureRecognizers: {
                            Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          },
                          markers: markers,
                          ),
                    ),
                  ],
                );
              },
            ),
 */