
import 'dart:convert';

import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/services/product_service.dart';
import 'package:ecom_app/widgets/product_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;
  ProductsByCategoryScreen({this.categoryName, this.categoryId});
  @override
  _ProductsByCategoryScreenState createState() => _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {

  ProductService _productService = ProductService();

  List<Product> _productListByCategory = List<Product>();

    @override
  void initState(){
    super.initState();
     _getProductsByCategory();

  }

  _getProductsByCategory() async{
    var products = await _productService.getProductsByCategoryId(this.widget.categoryId);
    var _list = json.decode(products.body);
    _list['data'].forEach((data){
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price= data['price'];
      model.discount = data['discount'];
      model.productDetail = data['detail'];


      setState(() {
        _productListByCategory.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.categoryName),
      ),

      body: SingleChildScrollView(
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: _productListByCategory.length,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index) => InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(
                //    // builder: (context) => ShowPhoto()
                // )
                // );
              },
              child: ProductByCategory(this._productListByCategory[index]),
            ),

            staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 3 : 2),


          ),
      )
        /*GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _productListByCategory.length,
           itemBuilder: (context, index){

             return ProductByCategory(this._productListByCategory[index]);

           }
           ),*/

    );
  }


}