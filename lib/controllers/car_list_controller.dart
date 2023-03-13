import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car_model.dart';


// final carRef = FirebaseFirestore.instance.collection('user_with_car').withConverter<CarModel>(
//   fromFirestore: (snapshot,_) => CarModel.fromJson(snapshot.data()!),
//   toFirestore: (car, _) => car.toJson(),
// );
  final collection = FirebaseFirestore.instance.collection('user_with_car');

// Stream<QuerySnapshot<Map<String, dynamic>>> getCarModel(String email) {
//   print("RECIEVE");
//   var collection = FirebaseFirestore.instance.collection('user_with_car').snapshots().map((snapshot) => snapshot.docs.map((doc) =>
//   {
//     if (doc == email) {
//       doc
//           .data()
//           .values
//           .map((eachCar) => CarModel.fromJson(eachCar))
//     }
//   }));
//
//   return collection;

  // if (docSnapshot.exists) {
  //   Map<String, dynamic>? data = docSnapshot.data();
  //   var value = data?['car_lsit'].toList();
  //   result = value.map(
  //           (e) => CarModel.fromJson(Map<String, dynamic>.from(e))
  //   ).toList();
  //   print(result.length);
  //   return result;
  // } else {
  //   return result;
  // }

// }