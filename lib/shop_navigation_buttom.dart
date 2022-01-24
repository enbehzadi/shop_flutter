import 'package:flutter/material.dart';
import 'package:shop_flutter/branchespage.dart';
import 'loginpage.dart';
class ShopNavigationButtom extends StatelessWidget {
  const ShopNavigationButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      clipBehavior: Clip.antiAlias,

      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
            width: MediaQuery.of(context).size.width/2-20,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[

                  Icon(Icons.map_outlined,color: Colors.blueGrey[600],),
                  Material(

                  child:GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => branchespage()),
                      );
                    },

                  child:
                    Icon(Icons.shopping_basket_outlined,
                      color: Colors.blueGrey[600],

                  ),

                  ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width/2-20,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  Icon(Icons.search_outlined,color: Colors.blueGrey[600]),

                  Icon(Icons.person_outline,color: Colors.blueGrey[600]),
                ],
              ),
            ),
          ]
          ,
        ),
      ),
    );


  }
}
