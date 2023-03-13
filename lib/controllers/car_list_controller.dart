import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car_model.dart';


Future<List<CarModel>> getCarModel(String email) async {
  var result = <CarModel>[];
  var collection = FirebaseFirestore.instance.collection('user_with_car');
  var docSnapshot = await collection.doc(email).get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    var value = data?['car_lsit'].toList();
    result = value.map(
            (e) => CarModel.fromJson(Map<String, dynamic>.from(e))
    ).toList();
    return result;
  } else {
    return result;
  }

}