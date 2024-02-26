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
  }
}
