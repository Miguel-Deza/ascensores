
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

  // TextEditingController _doorFrameController = TextEditingController();
  // String get doorFrameController => _doorFrameController.text;
  // set doorFrameController(String value) {
  //   _doorFrameController.text = value;
  //   notifyListeners();
  // }

  int _amountDoorFrame = 0;
  int get amountDoorFrame => _amountDoorFrame;
  set amountDoorFrame(int value) {
    _amountDoorFrame = value;
    notifyListeners();
  }

  int _amountAutomaticMarker = 0;
  int get amountAutomaticMarker => _amountAutomaticMarker;
  set amountAutomaticMarker(int value) {
    _amountAutomaticMarker = value;
    notifyListeners();
  }

  int _amountVoiceSynthesizer = 0;
  int get amountVoiceSynthesizer => _amountVoiceSynthesizer;
  set amountVoiceSynthesizer(int value) {
    _amountVoiceSynthesizer = value;
    notifyListeners();
  }

  int _amountGong = 0;
  int get amountGong => _amountGong;
  set amountGong(int value) {
    _amountGong = value;
    notifyListeners();
  }

  int _amountFireFightersCop = 0;
  int get amountFireFightersCop => _amountFireFightersCop;
  set amountFireFightersCop(int value) {
    _amountFireFightersCop = value;
    notifyListeners();
  }

  int _amountFireFightersLop = 0;
  int get amountFireFightersLop => _amountFireFightersLop;
  set amountFireFightersLop(int value) {
    _amountFireFightersLop = value;
    notifyListeners();
  }

  int _amountFans = 0;
  int get amountFans => _amountFans;
  set amountFans(int value) {
    _amountFans = value;
    notifyListeners();
  }

  int _amountSeismicSensor = 0;
  int get amountSeismicSensor => _amountSeismicSensor;
  set amountSeismicSensor(int value) {
    _amountSeismicSensor = value;
    notifyListeners();
  }

  int _amountTransformer = 0;
  int get amountTransformer => _amountTransformer;
  set amountTransformer(int value) {
    _amountTransformer = value;
    notifyListeners();
  }

  int _amountExtraCable = 0;
  int get amountExtraCable => _amountExtraCable;
  set amountExtraCable(int value) {
    _amountExtraCable = value;
    notifyListeners();
  }

  int _amountWirelessCardReader = 0;
  int get amountWirelessCardReader => _amountWirelessCardReader;
  set amountWirelessCardReader(int value) {
    _amountWirelessCardReader = value;
    notifyListeners();
  }

  int _amountWirelessCard = 0;
  int get amountWirelessCard => _amountWirelessCard;
  set amountWirelessCard(int value) {
    _amountWirelessCard = value;
    notifyListeners();
  }

  int _amountTftCabin = 0;
  int get amountTftCabin => _amountTftCabin;
  set amountTftCabin(int value) {
    _amountTftCabin = value;
    notifyListeners();
  }

  int _amountTftFloor = 0;
  int get amountTftFloor => _amountTftFloor;
  set amountTftFloor(int value) {
    _amountTftFloor = value;
    notifyListeners();
  }

  int _amountKeyLockSystem = 0;
  int get amountKeyLockSystem => _amountKeyLockSystem;
  set amountKeyLockSystem(int value) {
    _amountKeyLockSystem = value;
    notifyListeners();
  }

  int _amountLcdCabin = 0;
  int get amountLcdCabin => _amountLcdCabin;
  set amountLcdCabin(int value) {
    _amountLcdCabin = value;
    notifyListeners();
  }

  int _amountLcdFloor = 0;
  int get amountLcdFloor => _amountLcdFloor;
  set amountLcdFloor(int value) {
    _amountLcdFloor = value;
    notifyListeners();
  }

  void printQuoteFormProviderData() {
    print('Project Name: $_projectName');
    print('Project Description: $_projectDescription');
    print('Selected Elevator Brand: $_selectedElevatorBrand');
    print('Selected Elevator Model: $_selectedElevatorModel');
    print('Selected Elevator Use: $_selectedElevatorUse');
    print('Selected Elevator Velocity: $_selectedElevatorVelocity');
    print('Stops Number: $_stopsNumber');
    print('Require Double Access: $_requireDobleAccess');
    print('Selected Number Panoramic Faces: $_selectedNumberPanoramicFaces');
    print('Selected Door Width: $_selectedDoorWidth');
    //Door details print
    print('Selected Option Cabin: $_selectedOptionCabin');
    print('Selected Access Door: $_selectedAccessDoor');
    print('Selected Option Stop 1: $_selectedOptionStop1');
    print('Selected Option Stop 2: $_selectedOptionStop2');
    //Cabin details print
    print('Selected Cabin Type: $_selectedCabinType');
    print('Selected Cabin Roof: $_selectedCabinRoof');
    print('Selected Cabin Floor: $_selectedCabinFloor');
    print('Selected Cabin Handrail: $_selectedCabinHandrail');
    //Amounts cabins
    print('Door Frame: $amountDoorFrame');
    print('Automatic Marker: $amountAutomaticMarker');
    print('Voice Synthesizer: $amountVoiceSynthesizer');
    print('Gong: $amountGong');
    print('Fire Fighters Cop: $amountFireFightersCop');
    print('Fire Fighters Lop: $amountFireFightersLop');
    print('Fans Controller: $amountFans');
    print('Seismic Sensor: $amountSeismicSensor');
    print('Transformer Controller: $amountTransformer');
    print('Extra Cable: $amountExtraCable');
    print('Wireless Card Reader: $amountWirelessCardReader');
    print('Wireless Card: $amountWirelessCard');
    print('Tft Cabin: $amountTftCabin');
    print('Tft Floor: $amountTftFloor');
    print('Key Lock System: $amountKeyLockSystem');
    print('Lcd Cabin: $amountLcdCabin');
    print('Lcd Floor: $amountLcdFloor');
  }
}
