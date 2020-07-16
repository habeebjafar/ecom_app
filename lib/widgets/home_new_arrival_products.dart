import 'package:ecom_app/models/product.dart';
import 'package:flutter/material.dart';

import 'home_hot_product.dart';

class HomeNewArrivalProducts extends StatefulWidget {
  final  List<Product> newArrivalproductList;
  HomeNewArrivalProducts({this.newArrivalproductList});
  @override
  _HomeNewArrivalProductsState createState() => _HomeNewArrivalProductsState();
}

class _HomeNewArrivalProductsState extends State<HomeNewArrivalProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.newArrivalproductList.length,
        itemBuilder: (context, index){
          return HomeHotProduct(this.widget.newArrivalproductList[index]);
        }


        ),
      
    );
  }
}