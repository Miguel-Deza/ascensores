import 'package:flutter/material.dart';

class QuoteFormProvider with ChangeNotifier {
  String _projectName = "";
  String get projectName => _projectName;
  set projectName(String value) {
    _projectName = value;
    notifyListeners();
  }

  String _projectDescription = "";
  String get projectDescription => _projectDescription;
  set projectDescription(String value) {
    _projectDescription = value;
    notifyListeners();
  }

  String _selectedElevatorBrand = "";
  String get selectedElevatorBrand => _selectedElevatorBrand;
  set selectedElevatorBrand(String value) {
    _selectedElevatorBrand = value;
    notifyListeners();
  }

  String _selectedElevatorModel = "";
  String get selectedElevatorModel => _selectedElevatorModel;
  set selectedElevatorModel(String value) {
    _selectedElevatorModel = value;
    notifyListeners();
  }

  String _selectedElevatorUse = "";
  String get selectedElevatorUse => _selectedElevatorUse;
  set selectedElevatorUse(String value) {
    _selectedElevatorUse = value;
    notifyListeners();
  }

  String _selectedElevatorVelocity = "";
  String get selectedElevatorVelocity => _selectedElevatorVelocity;
  set selectedElevatorVelocity(String value) {
    _selectedElevatorVelocity = value;
    notifyListeners();
  }

  int _stopsNumber = 0;
  int get stopsNumber => _stopsNumber;
  set stopsNumber(int value) {
    _stopsNumber = value;
    notifyListeners();
  }

  bool _requireDobleAccess = false;
  bool get requireDobleAccess => _requireDobleAccess;
  set requireDobleAccess(bool value) {
    _requireDobleAccess = value;
    notifyListeners();
  }

  String _selectedNumberPanoramicFaces = "";
  String get selectedNumberPanoramicFaces => _selectedNumberPanoramicFaces;
  set selectedNumberPanoramicFaces(String value) {
    _selectedNumberPanoramicFaces = value;
    notifyListeners();
  }

  String _selectedDoorWidth = "";
  String get selectedDoorWidth => _selectedDoorWidth;
  set selectedDoorWidth(String value) {
    _selectedDoorWidth = value;
    notifyListeners();
  }

  //////////////////////////
  ///  Door Details   ///
  //////////////////////////

  String _selectedOptionCabin = "";
  String get selectedOptionCabin => _selectedOptionCabin;
  set selectedOptionCabin(String value) {
    _selectedOptionCabin = value;
    notifyListeners();
  }

  String _selectedAccessDoor = "";
  String get selectedAccessDoor => _selectedAccessDoor;
  set selectedAccessDoor(String value) {
    _selectedAccessDoor = value;
    notifyListeners();
  }

  String _selectedOptionStop1 = "";
  String get selectedOptionStop1 => _selectedOptionStop1;
  set selectedOptionStop1(String value) {
    _selectedOptionStop1 = value;
    notifyListeners();
  }

  String _selectedOptionStop2 = "";
  String get selectedOptionStop2 => _selectedOptionStop2;
  set selectedOptionStop2(String value) {
    _selectedOptionStop2 = value;
    notifyListeners();
  }

  //////////////////////////
  ///  Cabin Details   /////
  //////////////////////////

  String _selectedCabinType = "";
  String get selectedCabinType => _selectedCabinType;
  set selectedCabinType(String value) {
    _selectedCabinType = value;
    notifyListeners();
  }

  String _selectedCabinRoof = "";
  String get selectedCabinRoof => _selectedCabinRoof;
  set selectedCabinRoof(String value) {
    _selectedCabinRoof = value;
    notifyListeners();
  }

  String _selectedCabinFloor = "";
  String get selectedCabinFloor => _selectedCabinFloor;
  set selectedCabinFloor(String value) {
    _selectedCabinFloor = value;
    notifyListeners();
  }

  String _selectedCabinHandrail = "";
  String get selectedCabinHandrail => _selectedCabinHandrail;
  set selectedCabinHandrail(String value) {
    _selectedCabinHandrail = value;
    notifyListeners();
  }

  TextEditingController _doorFrameController = TextEditingController();
  String get doorFrameController => _doorFrameController.text;
  set doorFrameController(String value) {
    _doorFrameController.text = value;
    notifyListeners();
  }

  void printQuoteFormProviderData() {
    print('Project Name: ${_projectName}');
    print('Project Description: ${_projectDescription}');
    print('Selected Elevator Brand: ${_selectedElevatorBrand}');
    print('Selected Elevator Model: ${_selectedElevatorModel}');
    print('Selected Elevator Use: ${_selectedElevatorUse}');
    print('Selected Elevator Velocity: ${_selectedElevatorVelocity}');
    print('Stops Number: ${_stopsNumber}');
    print('Require Double Access: ${_requireDobleAccess}');
    print('Selected Number Panoramic Faces: ${_selectedNumberPanoramicFaces}');
    print('Selected Door Width: ${_selectedDoorWidth}');
    //Door details print
    print('Selected Option Cabin: ${_selectedOptionCabin}');
    print('Selected Access Door: ${_selectedAccessDoor}');
    print('Selected Option Stop 1: ${_selectedOptionStop1}');
    print('Selected Option Stop 2: ${_selectedOptionStop2}');
    //Cabin details print
    print('Selected Cabin Type: ${_selectedCabinType}');
    print('Selected Cabin Roof: ${_selectedCabinRoof}');
    print('Selected Cabin Floor: ${_selectedCabinFloor}');
    print('Selected Cabin Handrail: ${_selectedCabinHandrail}');
    print('Door Frame: ${_doorFrameController.text}');
  }
}
