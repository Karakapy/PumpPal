import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class Car{
  Car({
    required this.bodyType,
    required this.carName,
    required this.fuelTankCapacityL,
    required this.fuelType,
    required this.make,
    required this.makeYear,
    required this.mileageKmpl,
    required this.mileageRun,
    required this.model,
    required this.seatingCapacity
  });

  final String bodyType;
  final String carName;
  final double fuelTankCapacityL;
  final String fuelType;
  final String make;
  final double makeYear;
  final double mileageKmpl;
  final String mileageRun;
  final String model;
  final double seatingCapacity;


  Car.fromJson(Map<String, Object?> json): this(
    bodyType: json['bodyType']! as String,
    carName: json['carName']! as String,
    fuelTankCapacityL: double.parse(json['fuelTankCapacityL'].toString()),
    fuelType: json['fuelType'] as String,
    make: json['make'] as String,
    makeYear:  double.parse(json['makeYear'].toString()),
    mileageRun: json['mileageRun'] as String,
    model: json['model'] as String,
    mileageKmpl: double.parse(json['mileageKmpl'].toString()),
    seatingCapacity: double.parse(json['seatingCapacity'].toString()),
  );

  Map<String, Object?> toJson(){
    return{
      'bodyType': bodyType,
      'carName': carName,
      'fuelTankCapacityL' : fuelTankCapacityL,
      'fuelType': fuelType,
      'make': make,
      'makeYear': makeYear,
      'mileageKmpl': mileageKmpl,
      'mileageRun': mileageRun,
      'model': model,
      'seatingCapacity': seatingCapacity
    };
  }

}


final carRef = FirebaseFirestore.instance.collection('Car_detail').withConverter<Car>(
  fromFirestore: (snapshot,_) => Car.fromJson(snapshot.data()!),
  toFirestore: (car, _) => car.toJson(),
);


class AddCar extends StatefulWidget{
  const AddCar({super.key});

  @override
  State<StatefulWidget> createState() => _AddCarPageState();

}

class _AddCarPageState extends State<AddCar>{
  late List<String> brandList = List.empty();
  late List<String> modelList = List.empty();
  late List<String> yearList = List.empty();
  String? selectedBrand;
  String? selectedModel;
  String? selectedYear;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: carRef.snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final car = snapshot.data!;
          brandList = car.docs.map((eachCars) => eachCars['make'].toString()).toSet().toList();
          modelList = car.docs.where((element) => element['make'].toString().toLowerCase() == selectedBrand.toString().toLowerCase()).map((e) => e['model'].toString()).toSet().toList();
          yearList = car.docs.where((element) => element['model'].toString().toLowerCase() == selectedModel.toString().toLowerCase()).map((e) => e['makeYear'].toString()).toSet().toList();
          yearList.sort();

          return
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      child: DropdownButton<String>(
                        value: selectedBrand,
                        hint: Text("Select Car's Brand"),
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 40,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedBrand = value!;
                            selectedModel = null;
                            selectedYear = null;

                          });
                        },
                        items: brandList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    Container(

                      child: DropdownButton<String>(
                        value: selectedModel,
                        hint: Text("Select Car's Model"),
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 40,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedModel = value!;
                            selectedYear = null;

                          });
                        },
                        items: modelList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),


                    Container(

                      child: DropdownButton<String>(
                        value: selectedYear,
                        hint: Text("Select Car's Model Year"),
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 40,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {

                            selectedYear = value!;

                          });
                        },
                        items: yearList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    Container(
                      child: ElevatedButton(
                        child: Text("SAVE"),
                        onPressed: selectedYear != null?() {
                          print(
                              car.docs.where((element) => element['model'].toString().toLowerCase() == selectedModel.toString().toLowerCase()).map((e) => e.data()).toSet().toList().first
                          );

                        }:
                        null
                        ,


                      ),
                    ),

                  ],
                )
            );

        },
      ),
    );
  }

}


