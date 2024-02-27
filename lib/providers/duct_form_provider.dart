import 'package:flutter/material.dart';

class DuctFormProvider with ChangeNotifier {
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

  //Print all data from Duct Form Provider
  void printDataDuctFormProvider() {
    print("selectedBuildingUse: $selectedBuildingUse");
    print("selectedStopsNumber: $selectedStopsNumber");
    print("selectedBuildingHeight: $selectedBuildingHeight");
    print("selectedFloorArea: $selectedFloorArea");
    print("selectedExpressZoneFloor: $selectedExpressZoneFloor");
    print("selectedUnitPerLevel: $selectedUnitPerLevel");
  }
}
