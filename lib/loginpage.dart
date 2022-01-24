import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_flutter/login_responce_model.dart';

class LoginPage extends StatelessWidget{

var usernameController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ورود",
            style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
          ),
          centerTitle: true,
          leading: const Icon(
              Icons.arrow_back,
              color: Colors.black45
          ),
          backgroundColor: Colors.white,
          elevation: 0,


        ),
        body: LoginUi()
    );
  }
    Widget LoginUi(){
    return Builder(
      builder:(context)=>Stack(
        children:  <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
        child:Align(

        alignment: Alignment.topCenter,
        child: Text(
              "Sign In",
              style: TextStyle(fontFamily: "vazir",fontSize: 55,color: Colors.grey[400]),
           textAlign: TextAlign.center
            ),

        ),
      ),
          Center(
            child: Padding(padding: EdgeInsets.only(left: 70,right: 70),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Material(
                   child:  TextField(
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: "نام کاربری",
                       hintStyle: TextStyle(color: Colors.grey),
                       contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                       icon: Padding(padding: EdgeInsets.only(left: 20),
                         child: Icon(Icons.perm_identity,color: Colors.grey[500],),
                       )
                     ),
                     textAlign: TextAlign.center,
                     style: TextStyle(fontFamily: "vazir",fontSize: 20),
                       controller: usernameController,
                   ),
                   elevation: 20,
                   borderRadius:BorderRadius.circular(40),
                   shadowColor: Colors.grey[200],

                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Material(
                   child:  TextField(
                     decoration: InputDecoration(
                         border: InputBorder.none,
                         hintText: "رمز عبور",
                         contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                         icon: Padding(padding: EdgeInsets.only(left: 20),
                           child: Icon(Icons.lock_outline,color: Colors.grey[500],),

                         )
                     ),
                     obscureText: true,
                     textAlign: TextAlign.center,
                     style: TextStyle(fontFamily: "vazir",fontSize: 20),
                     controller: passwordController,
                   ),
                   elevation: 20,
                   borderRadius:BorderRadius.circular(40),
                   shadowColor: Colors.grey[200],

                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Padding(
                     padding: EdgeInsets.only(left: 50,right: 50),
                 
                 child:Material(
                   elevation: 20,
                   borderRadius:BorderRadius.circular(40),
                   color: Colors.red[900],
                   child: InkWell(
                     onTap: (){

                          sendLoginRequest(context: context, username: usernameController.text, password: passwordController.text);
                     },

                     child: Container(
                       height: 60,
                      child:Center(
                      child: Text("ورود",style: TextStyle(fontFamily: "vazir",color: Colors.white,fontSize: 20)),
                     ),
                     ),
                   ),
                 ),
                 ),
               ],
             ),
            )
          )
        ],
          ),
    );

    }
    void sendLoginRequest({required BuildContext context,required String username,required String password}) async{
      var url="http://welearnacademy.ir/flutter/api/?type=login";
      var body=Map<String,dynamic>();
      body["username"]=username;
      body["password"]=password;
      Response responce=await post(Uri.parse(url),body:body);
      if(responce.statusCode==200)
        {
          //success
          var loginJson=json.decode(utf8.decode(responce.bodyBytes));
          var model=LoginResponceModel(loginJson["result"],loginJson["message"]);
          if(model.result==1)
          {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => main()),
            // );
          }
          else if(model.result==0)
          {
            ShowMySnackbar(context,"نام کاربری یا رمز عبور اشتباه است.");

          }

        }
      else
        {
          //error
          ShowMySnackbar(context,"درخواست با خطا مواجه شد.");
        }
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
