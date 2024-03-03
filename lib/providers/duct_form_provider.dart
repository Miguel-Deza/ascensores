import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DuctFormProvider with ChangeNotifier {
  List dataTabla = [];

  List getData() {
    return dataTabla;
  }

  Future<void> getDataTable(String bearerKey) async {
    try {
      final response = await http.get(
          Uri.parse('https://dev.ktel.pe/api/elevator-calculations'),
          headers: {'Authorization': 'Bearer $bearerKey'});
      if (response.statusCode == 200) {
        print(response.body); // Imprime el cuerpo de la respuesta
        dataTabla = jsonDecode(response.body);
        notifyListeners();
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el getDataTable: $e');
    }
  }

  Future<void> deleteRowFromTable(
      String indexToDelete, String bearerKey) async {
    String apiUrl =
        'https://dev.ktel.pe/api/elevator-calculations/$indexToDelete';
    try {
      http.Response response = await http.delete(Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer $bearerKey'});

      if (response.statusCode == 200) {
        print("Eliminado con éxito");
        notifyListeners();
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el deleteRowFromTable: $e');
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
  getDataFromAPI(String bearerKey) async {
    //! VALUES TO TEST
    // Map<String, dynamic> dataToPass = {
    //   "building_type_id": 6,
    //   "stops": 12,
    //   "height": 4,
    //   "surface": 300, //m2q
    //   "express_floors": 0,
    //   "units_per_level_served": 12,
    //   "is_hospital": false,
    //   "capacity": 8,
    //   "velocity": 3.0,
    //   "safety_margin": 100,
    //   "door_width": 0.85,
    //   "door_technology": "lateral"
    // };

    //!USE THIS VALUES
    Map<String, dynamic> dataToPass = {
      "building_type_id": int.parse(selectedBuildingUse),
      "stops": int.parse(selectedStopsNumber),
      "height": double.parse(selectedBuildingHeight),
      "surface": double.parse(selectedFloorArea),
      "express_floors": int.parse(selectedExpressZoneFloor),
      "units_per_level_served": int.parse(selectedUnitPerLevel),
      "is_hospital": false,
      "capacity": int.parse(selectedPassengerCount),
      "velocity": double.parse(selectedElevatorSpeed),
      "safety_margin": 100,
      "door_width": (double.parse(selectedDoorWidth) / 1000),
      "door_technology": selectedDoorType,
    };
    const apiEndpoint = "https://dev.ktel.pe/api/elevator-calculations";
    try {
      http.Response response = await http.post(Uri.parse(apiEndpoint),
          headers: {
            'Authorization': 'Bearer $bearerKey',
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
      print('Error en el getDataFromAPI: $e');
    }
  }
  //API GET CALCULATIONS

//Select Building Use Test
  var testBuildingUseDropdownList = {
    "Oficinas céntricas": "1",
    "Oficinas suburbanas": "2",
    "Oficinas corporativas": "3",
    "Edificio gubernamental": "4",
    "Departamentos alta rentabilidad": "5",
    "Departamentos rentabilidad media": "6",
    "Hospital privado": "7",
    "Hospital estatal": "8",
    "Hotel alta rentabilidad cosmopolita": "9",
    "Hotel alta rentabilidad veraneo": "10",
    "Hotel baja rentabilidad cosmopolita": "11",
    "Hotel baja rentabilidad veraneo": "12",
    "Estacionamiento autoservicio": "13",
    "Estacionamiento tienda departamental": "14",
  };

  String selectedBuildingUse = "1";
  void setSelectedBuildingUse(String value) {
    selectedBuildingUse = value;
    print(selectedBuildingUse);
    notifyListeners(); // Notifica a los widgets que escuchan este provider que el valor ha cambiado
  }

  //Stops Number selected
  String selectedStopsNumber = "12";
  setSelectedStopsNumber(String value) {
    selectedStopsNumber = value;
    notifyListeners();
  }

  String selectedBuildingHeight = "4";
  setSelectedBuildingHeight(String value) {
    selectedBuildingHeight = value;
    notifyListeners();
  }

  String selectedFloorArea = "300";
  setSelectedFloorArea(String value) {
    selectedFloorArea = value;
    notifyListeners();
  }

  String selectedExpressZoneFloor = "0";
  setSelectedExpressZoneFloor(String value) {
    selectedExpressZoneFloor = value;
    notifyListeners();
  }

  String selectedUnitPerLevel = "12";
  setSelectedUnitPerLevel(String value) {
    selectedUnitPerLevel = value;
    notifyListeners();
  }

  // Tecnical Characteristics
  List<String> passengerCountDropdownList = [
    "5",
    "6",
    "8",
    "10",
    "13",
    "17",
    "21",
    "50",
  ];
  String selectedPassengerCount = "5";
  setSelectedPassengerCount(String value) {
    selectedPassengerCount = value;
    notifyListeners();
  }

  List<String> elevatorSpeedDropdownList = [
    "0.4",
    "0.63",
    "1.0",
    "1.6",
    "1.75",
    "2.0",
    "3.0",
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
    "850",
    "900",
    "1000",
    "1100",
    "1200",
    "1300",
    "1400",
    "1500",
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
