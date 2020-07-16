import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';



Widget carouselSlider(items)=> SizedBox(
  height: 200,
  child: Carousel(
    images: items,
    boxFit: BoxFit.cover,
    autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
  ),
  
  
);