import 'package:ascensores/screens/create_project_page/duct_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';


class GetGeneralDataScreen extends StatefulWidget {
  GetGeneralDataScreen({super.key});

  @override
  State<GetGeneralDataScreen> createState() => _GetGeneralDataScreenState();
}

class _GetGeneralDataScreenState extends State<GetGeneralDataScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String locationMessage = 'Current Location of the User';
  late String lat;
  late String long;

  //Getting Current Location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los servicios de ubicación están deshabilitados.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los servicios de ubicación están permanentemente deshabilitados. No podemos procesar la solicitud.');
    }

    return await Geolocator.getCurrentPosition();
  }

  //Listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = "Lat: $lat, Long: $long";
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    Uri googleUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');

    await canLaunchUrl(googleUrl)
        ? await launchUrl(googleUrl)
        : throw 'Could not launch $googleUrl';
  }

  @override
  void initState() {
    // TODO: implement initState
    _liveLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blue[900],
        elevation: 5.0,
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          'Nuevo proyecto',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                              
                const Text("Ingrese los siguientes datos"),
                FormBuilderTextField(
                  name: 'nombre',
                  decoration: const InputDecoration(
                    labelText: 'NOMBRE DEL PROYECTO',
                  ),
                ),
                FormBuilderTextField(
                  name: 'ruc',
                  decoration: const InputDecoration(
                    labelText: 'RUC',
                  ),
                ),
                FormBuilderTextField(
                  name: 'direccion',
                  decoration: const InputDecoration(
                    labelText: 'DIRECCIÓN',
                  ),
                ),
                FormBuilderTextField(
                  name: 'observaciones',
                  decoration: const InputDecoration(
                    labelText: 'OBSERVACIONES',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.saveAndValidate()) {
                      //   print(_formKey.currentState!.value);
                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DuctDesignScreen(),
                        ),
                      );
                    },
                    child: const Text('Continuar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
