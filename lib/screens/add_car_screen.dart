import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:pumppal/screens/result_screen.dart';
import '../models/car_model.dart';
import '../widgets/button_widget.dart';
// import 'models/car_model.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {

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
      backgroundColor: whiteColor,
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

            brandList.sort();
            modelList.sort();
            yearList.sort();

          return Column(
            children: <Widget>[
              SizedBox(height: 80,),
              Container(child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),),

              SizedBox(height: 30,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Please setup",style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'montserrat',
                              ),),
                            ),
                            Container(
                              child: Text("your car",style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'montserrat'
                              ),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 60,),
              Container(
                width: 340,
                child: DropdownButtonFormField2<String>(
                  value: selectedBrand,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select the brand',
                    style: TextStyle(fontSize: 18),
                  ),
                  items: brandList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the brand.';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      selectedBrand = value!;
                      selectedModel = null;
                      selectedYear = null;

                    });
                  },

                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: blackColor,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Container(
                width: 340,
                child: DropdownButtonFormField2<String>(
                  value: selectedModel,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select the model',
                    style: TextStyle(fontSize: 18),
                  ),
                  items: modelList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the model.';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      selectedModel = value!;
                      selectedYear = null;

                    });
                  },
                  // onSaved: (value) {
                  //   selectedModel = value.toString();
                  // },
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: blackColor,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Container(
                width: 340,
                child: DropdownButtonFormField2<String>(
                  value: selectedYear,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select the year',
                    style: TextStyle(fontSize: 18),
                  ),
                  items: yearList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),                  validator: (value) {
                    if (value == null) {
                      return 'Please select the year.';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                  // onSaved: (value) {
                  //   selectedYear = value.toString();
                  // },
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: blackColor,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 165,),
              Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child:ButtonWidget(
                      color: selectedYear==null? greyColor2: primaryColor,

                      theChild: Container(
                        width: 312.0,
                        height: 64.0,
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'montserrat',
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                      theOnTapFunc: (){
                        if(selectedYear != null && selectedModel != null && selectedBrand != null){
                          print(selectedBrand);
                          print(selectedModel);
                          print(selectedYear);
                        }
                      },
                      // theOnTapFunc: () {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) { return const ResultScreen(); }));
                      // }
                  )
              ),

            ],
          );
        }
      ),

    );
  }
}