import 'package:flutter/material.dart';
import 'package:shop_flutter/ShoppingBasketItem.dart';
import 'package:shop_flutter/shopping_basket_data.dart';

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: const Text(
            "سبد خرید",style: TextStyle(color:Colors.black45,fontFamily: "vazir"),
          ),
          centerTitle:true,leading: const Icon(
            Icons.arrow_back,
            color:Colors.black45
        ),
          backgroundColor: Colors.white,
          elevation: 0,

      ),
      body:BasketUI(),

    );
  }
  Widget BasketUI()
  {
    return Stack(
      children: <Widget>[
        Padding(
            padding:EdgeInsets.only(bottom: 85),

     child: ListView.builder(

      itemCount: ShoppingBasketData.getInstance().basketItems.length,
      itemBuilder: (context,position){
        return GestureDetector(
            child:Padding(
        padding: EdgeInsets.only(left: 10,right: 10,top: 10),
        child: ShoppingBasketItem( ShoppingBasketData.getInstance().basketItems[position],removeItem,position)
            ),
        );
      }
    ),
        ),
        Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.red,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    child: const Center(
                      child: Text(
                        "پرداخت",style: TextStyle(fontFamily: "vazir",fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
          ,
        ),
      ],
    );
  }
  void removeItem(int index){
    setState(() {
      ShoppingBasketData.getInstance().basketItems.removeAt(index);
    });
  }
}
