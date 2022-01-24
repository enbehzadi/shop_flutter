// ignore_for_file: null_argument_to_non_null_type

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shop_flutter/branch.dart';

// ignore: camel_case_types
class branchespage extends StatefulWidget {


  @override
  _BraState createState() => _BraState();
}

class _BraState extends State<branchespage> {
  final Set<Marker>  _branchesList={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "فروشگاه",style: TextStyle(color:Colors.black45,fontFamily: "Vazir"),
        ),
        centerTitle:true,leading: const Icon(
          Icons.arrow_back,
          color:Colors.black45
      ),
      ),

      body: GoogleMap
        (onMapCreated: OnComplete,
          markers: _branchesList,
          initialCameraPosition: CameraPosition(
              target: LatLng(32.309793,54.352169),
              zoom: 5
          ),

      )
      
    );
  }

  final Completer<GoogleMapController> _controller = Completer();
  void OnComplete(GoogleMapController controller)
  {
    _controller.complete();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPOints();
  }
  void fetchPOints() async{
    var url="http://welearnacademy.ir/flutter/branches.json";
    var response = await get(Uri.parse(url),headers: {"Accept":"application/json"});
    setState(() {
      var pointJson=json.decode(utf8.decode(response.bodyBytes));
      for(var point in pointJson){
        var b=branch(point['shop_name'],point['id'],point['tel'],point['lat'],point['lng'],point['manager']);
        Marker marker=Marker(
            markerId: MarkerId(b.id.toString()),
            position: LatLng(
                b.lat,
                b.lng),
            infoWindow: InfoWindow(
              title: b.shop_name,
              snippet: b.manager

            )
        );
        _branchesList.add(marker);
      }
    });
  }
}


