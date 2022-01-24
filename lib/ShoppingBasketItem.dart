// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop_flutter/product.dart';
import 'package:shop_flutter/shopping_basket_data.dart';
typedef _OnRemovePeressed(int index);
class ShoppingBasketItem extends StatefulWidget {
  Product _product;
  int _count=1;
  int _Index;
  _OnRemovePeressed _OnRemovePresed;
  ShoppingBasketItem(this._product,this._OnRemovePresed,this._Index
   );
  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height:200 ,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 40,left: 20),
              child: Image.network(
              widget._product.imageUrl,
                  width: 100,
                  height: 100
                 ),

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20,right: 20),
                    child: Text(
                    widget._product.productName,
                    style: TextStyle(fontFamily: "Vazir",
                        fontSize: 20),
                    ) ,
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                  GestureDetector(child:

                    const Icon(
                        Icons.chevron_right,
                        size: 35),
                    onTap: (){
                      Increment();
                    },

                  ),

                      const SizedBox(
                        width: 5,
                      ),
                   Text(
                      widget._count.toString(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(child:
                  const Icon(
                    Icons.chevron_left,
                    size: 35,),
                    onTap: (){
                      Decrement();
                    },
                  ),
                ],
                ),
                )
              ],
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 20,left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       GestureDetector(

                         onTap: (){
                           widget._OnRemovePresed(widget._Index);
                         },
                         child: Icon(Icons.delete_outline),
                    
                       ),
                        Text(
                          widget._product.price
                        )
                      ],
                    )
                  ),
                ),
            ),
          ],
        ),

      ),
    );
  }
  void Increment() {
      setState(() {
        widget._count++;
      });
  }
  void Decrement() {
    setState(() {
      if(widget._count==1)
          return;
      else {
          widget._count--;
        }
    });
  }


}
