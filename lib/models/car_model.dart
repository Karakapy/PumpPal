import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel{
  CarModel({
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


  CarModel.fromJson(Map<String, Object?> json): this(
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

final carRef = FirebaseFirestore.instance.collection('Car_detail').withConverter<CarModel>(
  fromFirestore: (snapshot,_) => CarModel.fromJson(snapshot.data()!),
  toFirestore: (car, _) => car.toJson(),
);
