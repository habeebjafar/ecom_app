import 'package:ecom_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/services/cart_service.dart';

import 'cart_screen.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail(this.product);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CartService _cartService = CartService();
  List<Product> _cartItems;

  initState(){
    super.initState();
    _getCartItem();
  }

    _getCartItem() async{

      _cartItems = List<Product>();
      var cartItems = await _cartService.getCartItems();
      cartItems.forEach((data){
        var product = Product();
        product.id = data['productId'];
        product.name = data['productName'];
        product.photo = data['productPhoto'];
        product.price = data['productPrice'];
        product.discount = data['productDiscount'];
        product.productDetail = data['productProduct'] ?? 'No detail';
        product.quantity = data['productQuantity'];

        setState(() {
          _cartItems.add(product);

        });


      });

    }

  _addToCart(BuildContext context, Product product) async {
    var result = await _cartService.addToCart(product);
    if(result > 0){
      _showSnackMessage(Text('Item added to cart successfully!', style: TextStyle(color: Colors.green),));
    } else {
      _showSnackMessage(Text('Failed to add to cart!', style: TextStyle(color: Colors.red),));
    }
  }

  _showSnackMessage(message){
   /* var snackBar = new SnackBar(
      content: message,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);*/
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        //duration: new Duration(seconds: tempo),
        content: message,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(this.widget.product.name),
        backgroundColor: Colors.redAccent,
         actions: <Widget>[
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CartScreen(_cartItems)
                  )
                  );
              },
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: 30,
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white,), 
                      onPressed: (){},
                      iconSize: 30.0,
                      ),
                      Positioned(
                        child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1, size: 25, color: Colors.black,),
                          Positioned(
                            top: 4,
                            right: 9,
                            child: Text(_cartItems.length.toString()),
                            )
                      
                          ],

                        )
                        )
                  ],
                ),
              ),
            ),
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  child: Image.network(this.widget.product.photo),
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: ListTile(
                    leading: Text(this.widget.product.name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    title: Row(
                      children: <Widget>[
                        Expanded(child: Text('${double.parse(this.widget.product.price) - double.parse(this.widget.product.discount)}', style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),)),
                        Expanded(child: Text('${this.widget.product.price}', style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
               // key: _scaffoldKey,
                onPressed: (){
                   _addToCart(context, this.widget.product);
                   setState(() {
                     _cartItems.length.toString();
                   });

                },

                textColor: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Text('Add to cart'),
                    IconButton(
                      onPressed: (){
                       // _addToCart(context, this.widget.product);

                      },
                      icon: Icon(Icons.shopping_cart),
                    )
                  ],
                ),
              ),

              IconButton(
                onPressed: (){},
                 icon: Icon(Icons.favorite_border, color: Colors.redAccent,)
                 )
            ],
            ),

          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                    Text('Product detail', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10.0,),
                    Text(this.widget.product.productDetail)

              ],
              // title: Text('Product detail', style: TextStyle(fontSize: 20),),
              // subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),

            ),
          ),
        ],
      ),
    );
  }
}