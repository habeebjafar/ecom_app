import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductByCategory extends StatefulWidget {
  final Product product;
  ProductByCategory(this.product);
  @override
  _ProductByCategoryState createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProductDetail(this.widget.product)
          ));
        },
        child: Card(
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.all(8.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              /* image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(widget.product.photo)
            ),*/
              //color: Colors.green
            ),
            child:Image.network(
              widget.product.photo, width: 190.0, height: 150.0,
              fit: BoxFit.cover,
            ),

          ),
        ),
      ),
    );

    /*  ListView(
      children: <Widget>[
        Image.network(widget.product.photo, width: 190.0, height: 150.0,),
    Text(widget.product.name),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      Text('Price: ${this.widget.product.price}'),
      Text('Discount: ${this.widget.product.discount}'),
      ],
      ),
      ]
    );*/
  }
}

