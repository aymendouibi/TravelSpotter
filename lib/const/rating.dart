// @dart=2.9

import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MyRating extends StatefulWidget {
   double rating;
   Function(double) onRated;
   bool isReadOnly;
  MyRating({this.rating,this.onRated,this.isReadOnly=false});
  @override
  State<MyRating> createState() => _MyRatingState();
}

class _MyRatingState extends State<MyRating> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SmoothStarRating(
          borderColor: const Color(0xFFFBBC05),
          color: const Color(0xFFFBBC05),
          allowHalfRating: false,
      rating: widget.rating,
      size: 45,
      starCount: 5,
      isReadOnly: widget.isReadOnly,
      onRated: widget.onRated
    ));
  }
}
/**(value) {
        setState(() {
          widget.rating= value;
        });
      }, */