import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DuctFormProvider with ChangeNotifier {
  //VALUES FROM TABLE
  List dataTabla = [];

  //GET VALUES FOR FUTURE TABLE
  Future<void> getDataTable() async {
    const String apiUrl = 'https://dev.ktel.pe/api/elevator-calculations';

    try {
      http.Response response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization':
            'Bearer 134|bhBFZWzmqN4Urxeki7TzCC53uEBn1gP6dpdwp8Fz1ae020b0'
      });

      if (response.statusCode == 200) {
        dataTabla = jsonDecode(response.body);
        notifyListeners();
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el getDataTable: $e');
    }
  }

  //GET VALUES AFTER CALCULATION
  String index = "0 personas/recámara";
  setIndex(String value) {
    selectedBuildingUse = value;
    notifyListeners();
  }

  String floors = "0";
  setFloors(String value) {
    floors = value;
    notifyListeners();
  }

  String percentage = "0";
  setPercentage(String value) {
    percentage = value;
    notifyListeners();
  }

  String totalPopulation = "0";
  setTotalPopulation(String value) {
    totalPopulation = value;
    notifyListeners();
  }

  String servedPopulation = "0";
  setServedPopulation(String value) {
    servedPopulation = value;
    notifyListeners();
  }

  String servedFloors = "0";
  setServedFloors(String value) {
    servedFloors = value;
    notifyListeners();
  }

  String probableStops = "0";
  setProbableStops(String value) {
    probableStops = value;
    notifyListeners();
  }

  String averageJump = "0";
  setAverageJump(String value) {
    averageJump = value;
    notifyListeners();
  }

  //GET TIMES AFTER CALCULATION
  String travelTimeForPartialStops = "0";
  setTravelTimeForPartialStops(String value) {
    travelTimeForPartialStops = value;
    notifyListeners();
  }

  String travelTimeForExpressFloors = "0";
  setTravelTimeForExpressFloors(String value) {
    travelTimeForExpressFloors = value;
    notifyListeners();
  }

  String accelerationAndDecelerationTime = "0";
  setAccelerationAndDecelerationTime(String value) {
    accelerationAndDecelerationTime = value;
    notifyListeners();
  }

  String falseStops = "0";
  setFalseStops(String value) {
    falseStops = value;
    notifyListeners();
  }

  String doorOpeningAndClosingTime = "0";
  setDoorOpeningAndClosingTime(String value) {
    doorOpeningAndClosingTime = value;
    notifyListeners();
  }

  String passengerEntryAndExitTime = "0";
  setPassengerEntryAndExitTime(String value) {
    passengerEntryAndExitTime = value;
    notifyListeners();
  }

  String recoveryTime = "0";
  setRecoveryTime(String value) {
    recoveryTime = value;
    notifyListeners();
  }

  String totalTime = "0";
  setTotalTime(String value) {
    totalTime = value;
    notifyListeners();
  }

  //API GET CALCULATIONS
  //getDataFromAPI
  getDataFromAPI() async {
    //! ESTOS SON VALORES DE PRUEBA
    Map<String, dynamic> dataToPass = {
      "building_type_id": 6,
      "stops": 12,
      "height": 4,
      "surface": 300,
      "express_floors": 0,
      "units_per_level_served": 12,
      "is_hospital": false,
      "capacity": 8,
      "velocity": 3.0,
      "safety_margin": 100,
      "door_width": 0.85,
      "door_technology": "lateral"
    };

    //!USE THIS VALUES
    // Map<String, dynamic> dataToPass = {
    //   "building_type_id": 6,
    //   "stops": int.parse(selectedStopsNumber),
    //   "height": double.parse(selectedBuildingHeight),
    //   "surface": double.parse(selectedFloorArea),
    //   "express_floors": int.parse(selectedExpressZoneFloor),
    //   "units_per_level_served": int.parse(selectedUnitPerLevel),
    //   "is_hospital": false,
    //   "capacity": 8,
    //   "velocity": double.parse(selectedElevatorSpeed),
    //   "safety_margin": 100.0,
    //   "door_width": (double.parse(selectedDoorWidth) / 1000),
    //   "door_technology": "lateral"
    // };
    const apiEndpoint = "https://dev.ktel.pe/api/elevator-calculations";
    try {
      http.Response response = await http.post(Uri.parse(apiEndpoint),
          headers: {
            'Authorization':
                'Bearer 134|bhBFZWzmqN4Urxeki7TzCC53uEBn1gP6dpdwp8Fz1ae020b0',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(dataToPass));
      print("Datos enviados");
      print(dataToPass);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        index = data["index"].toString();
        floors = data["floors"].toString();
        percentage = data["percentage"].toString();
        totalPopulation = data["total_population"].toString();
        servedPopulation = data["served_population"].toString();
        servedFloors = data["served_floors"].toString();
        probableStops = data["probable_stops"].toString();
        averageJump = data["average_jump"].toString();
        //TIME DATA

        travelTimeForPartialStops =
            data["travel_time_for_partial_stops"].toString();
        travelTimeForExpressFloors =
            data["travel_time_for_express_floors"].toString();
        accelerationAndDecelerationTime =
            data["acceleration_and_deceleration_time"].toString();
        falseStops = data["false_stops"].toString();
        doorOpeningAndClosingTime =
            data["door_opening_and_closing_time"].toString();
        passengerEntryAndExitTime =
            data["passenger_entry_and_exit_time"].toString();
        recoveryTime = data["recovery_time"].toString();
        totalTime = data["total_time"].toString();
        print(travelTimeForPartialStops);
        print(travelTimeForExpressFloors);
        print(accelerationAndDecelerationTime);
        print(falseStops);
        print(doorOpeningAndClosingTime);
        print(passengerEntryAndExitTime);
        print(recoveryTime);
        print(totalTime);
        notifyListeners();
      } else {
        print('Error en la petición: ${response.statusCode}');
        print('Error en la petición: ${response.body}');
      }
    } catch (e) {
      print('Error en el getDataTable: $e');
    }
  }
  //API GET CALCULATIONS

  //Select Building Use
  List<String> buildingUseDropdownList = [
    "Edificio 1",
    "Edificio 2",
    "Edificio 3"
  ];
  String selectedBuildingUse = "Edificio 1";
  setSelectedBuildingUse(String value) {
    selectedBuildingUse = value;
    notifyListeners();
  }

  //Stops Number selected
  String selectedStopsNumber = "0";
  setSelectedStopsNumber(String value) {
    selectedStopsNumber = value;
    notifyListeners();
  }

  String selectedBuildingHeight = "0";
  setSelectedBuildingHeight(String value) {
    selectedBuildingHeight = value;
    notifyListeners();
  }

  String selectedFloorArea = "0";
  setSelectedFloorArea(String value) {
    selectedFloorArea = value;
    notifyListeners();
  }

  String selectedExpressZoneFloor = "0";
  setSelectedExpressZoneFloor(String value) {
    selectedExpressZoneFloor = value;
    notifyListeners();
  }

  String selectedUnitPerLevel = "0";
  setSelectedUnitPerLevel(String value) {
    selectedUnitPerLevel = value;
    notifyListeners();
  }

  // Tecnical Characteristics
  List<String> passengerCountDropdownList = [
    "1",
    "2",
    "3",
  ];
  String selectedPassengerCount = "1";
  setSelectedPassengerCount(String value) {
    selectedPassengerCount = value;
    notifyListeners();
  }

  List<String> elevatorSpeedDropdownList = [
    "0.4",
    "0.63",
    "1.0",
  ];
  String selectedElevatorSpeed = "0.4";
  setSelectedElevatorSpeed(String value) {
    selectedElevatorSpeed = value;
    notifyListeners();
  }

  List<String> doorWidthDropdownList = [
    "700",
    "750",
    "800",
  ];
  String selectedDoorWidth = "700";
  setSelectedDoorWidth(String value) {
    selectedDoorWidth = value;
    notifyListeners();
  }

  String selectedDoorType = "Lateral";
  setSelectedDoorType(String value) {
    selectedDoorType = value;
    notifyListeners();
  }

  //Print all data from Duct Form Provider
  void printDataDuctFormProvider() {
    print("selectedBuildingUse: $selectedBuildingUse");
    print("selectedStopsNumber: $selectedStopsNumber");
    print("selectedBuildingHeight: $selectedBuildingHeight");
    print("selectedFloorArea: $selectedFloorArea");
    print("selectedExpressZoneFloor: $selectedExpressZoneFloor");
    print("selectedUnitPerLevel: $selectedUnitPerLevel");
    //Second Screen Data
    print("selectedPassengerCount: $selectedPassengerCount");
    print("selectedElevatorSpeed: $selectedElevatorSpeed");
    print("selectedDoorWidth: $selectedDoorWidth");
    print("selectedDoorType: $selectedDoorType");
  }
}

// Extras
// items: const [
//                       DropdownMenuItem<int>(
//                         value: 6,
//                         child: Text('6 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 8,
//                         child: Text('8 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 10,
//                         child: Text('10 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 11,
//                         child: Text('11 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 13,
//                         child: Text('13 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 16,
//                         child: Text('16 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 20,
//                         child: Text('20 pasajeros'),
//                       ),
//                       DropdownMenuItem<int>(
//                         value: 23,
//                         child: Text('23 pasajeros'),
//                       ),
//                     ],

//////////////////////////
///items: const [
//     DropdownMenuItem<double>(
//       value: 0.4,
//       child: Text('0.4 m/s'),
//     ),
//     DropdownMenuItem<double>(
//       value: 0.63,
//       child: Text('0.63 m/s'),
//     ),
//     DropdownMenuItem<double>(
//       value: 1.0,
//       child: Text('1.0 m/s'),
//     ),
//     DropdownMenuItem<double>(
//       value: 1.6,
//       child: Text('1.6 m/s'),
//     ),
//     DropdownMenuItem<double>(
//       value: 1.75,
//       child: Text('1.75 m/s'),
//     ),
//     DropdownMenuItem<double>(
//       value: 2.0,
//       child: Text('2.0 m/s'),
//     ),
//     DropdownMenuItem<double>(
//       value: 3.0,
//       child: Text('3.0 m/s'),
//     ),
//   ],
//   decoration: const InputDecoration(
//     labelText: 'Velocidad del ascensor',
//     border: OutlineInputBorder(),
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
// DropdownButtonFormField<int>(
//   value: selectedDoorWidth,
//   iconEnabledColor: Colors.white,
//   onChanged: (int? newValue) {
//     setState(() {
//       selectedDoorWidth = newValue!;
//     });
//   },
//   items: const [
//     DropdownMenuItem<int>(
//       value: 700,
//       child: Text('700 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 750,
//       child: Text('750 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 800,
//       child: Text('800 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 850,
//       child: Text('850 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 900,
//       child: Text('900 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 1000,
//       child: Text('1000 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 1100,
//       child: Text('1100 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 1200,
//       child: Text('1200 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 1300,
//       child: Text('1300 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 1400,
//       child: Text('1400 mm'),
//     ),
//     DropdownMenuItem<int>(
//       value: 1500,
//       child: Text('1500 mm'),
//     ),
//   ],

///////////////////////
///items: const [
//   DropdownMenuItem<int>(
//     value: 700,
//     child: Text('700 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 750,
//     child: Text('750 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 800,
//     child: Text('800 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 850,
//     child: Text('850 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 900,
//     child: Text('900 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 1000,
//     child: Text('1000 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 1100,
//     child: Text('1100 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 1200,
//     child: Text('1200 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 1300,
//     child: Text('1300 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 1400,
//     child: Text('1400 mm'),
//   ),
//   DropdownMenuItem<int>(
//     value: 1500,
//     child: Text('1500 mm'),
//   ),
// ],
