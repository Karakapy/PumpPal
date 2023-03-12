import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/oil_model.dart';
final dio = Dio();


class OilPrice extends StatefulWidget{
  const OilPrice({super.key});

  @override
  State<StatefulWidget> createState() => _OilPricePageState();
}

class _OilPricePageState extends State<OilPrice>{


  Future <List<Oil>> getOilPrice(String stationName) async{
    // var url = Uri.https('api.chnwt.dev', 'thai-oil-api/latest');
    // var response = await http.get(Uri.parse("http://localhost:3000/latest"));
    final response = await dio.get('https://api.chnwt.dev/thai-oil-api/latest');
    var oilDetail = <Oil>[];

    if(response.statusCode == 200){
      Map<String, dynamic> ss = Map<String, dynamic>.from(json.decode(response.toString())['response']['stations']);
        for(var oil in Map<String, dynamic>.from(ss[stationName]).keys){
          if(ss[stationName][oil]['name'] != "") {
            var eachOil = Oil(name: oil, price: double.parse(ss[stationName][oil]['price'].toString()));
            oilDetail.add(eachOil);
            print(eachOil.name);
        }
      }
    }
    return oilDetail;
  }

  Widget showOil(Oil oil) => ListTile(
    title: Text("${oil.name} ${oil.price}"),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getOilPrice('ptt'),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              final oil = snapshot.data!;
              return ListView(
                children: oil.map(showOil).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },

        ),
      ),
    );
  }

}