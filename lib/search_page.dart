import 'package:flutter/material.dart';
import 'package:shop_flutter/product.dart';
import 'shopping_basket_data.dart';
class search_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "جستجو",style: TextStyle(color:Colors.black45,fontFamily: "Vazir"),
        ),
        centerTitle:true,leading: const Icon(
          Icons.arrow_back,
          color:Colors.black45
      ),
        backgroundColor: Colors.white,
        elevation: 0,


      ),
      body:
      Builder(

        builder:(context)=>
      Column(
        children: <Widget>[
         ],
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
