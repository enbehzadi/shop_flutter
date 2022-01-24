import 'package:flutter/material.dart';
import 'package:shop_flutter/product.dart';
import 'shopping_basket_data.dart';
class descriptionPage extends StatelessWidget {
   Product _product;

   descriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Builder(

        builder:(context)=>
      Column(
        children: <Widget>[

          Align(

            child:Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "shoes",
                style: TextStyle(
                  fontFamily: "vazir",
                  color: Colors.red[700],
                  fontSize: 35
                ),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.network(_product.imageUrl,
              height: 280,
              width: 280,
              fit:BoxFit.contain,
            ),
          ),
          Text(
            _product.price,
            style: TextStyle(
              color:Colors.red[700],
              fontFamily: "vazir",
              fontSize: 30
            ),

          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _product.productName,
            style: TextStyle(
                color:Colors.grey[700],
                fontFamily: "vazir",
                fontSize: 20
            ),

          ),
          SizedBox(
            height: 20,
          ),
          Padding(

            padding: EdgeInsets.only(left: 45,right: 45),
            child: Text(
              _product.description,
              style: TextStyle(
                  color:Colors.grey[500],
                  fontFamily: "vazir",
                  fontSize: 16,

              ),textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,

            ),
          ),
          Expanded(

            child: Align(

              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                  child:GestureDetector(
                    onTap: ()
                    {


                      ShowMySnackbar(context," به سبد خرید اضافه شد${_product.productName}");
                      ShoppingBasketData.getInstance().basketItems.add(_product);
                      print(ShoppingBasketData.getInstance().basketItems.length);
                    },
                child: Container(
                    decoration: BoxDecoration(

                      color: Colors.red[600],
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  child: const Center(
                    child: Text("افزوردن به سبد خرید",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "vazir",
                        fontSize: 18,

                      ),
                    ),
                ),
                  width: MediaQuery.of(context).size.width-50,
                  height: 50,
                ),
                  ),
              )

            ),
          )
        ]
      ),
      ),
    );

  }
  void ShowMySnackbar(BuildContext cntx,String message)
  {
    ScaffoldMessenger.of(cntx).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(30.0),
        )
    );

  }

}
