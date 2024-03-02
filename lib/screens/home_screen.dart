import 'dart:convert';

import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/bottom/calculation_history_page.dart';
import 'package:ascensores/screens/bottom/trafic_study/trafic_study_page.dart';
import 'package:ascensores/screens/login_page.dart';
import 'package:ascensores/screens/quote_detail.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/bottom/duct_calculation/duct_calculation_page.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fullName;
  String? phone;
  String? email;
  // ! Estoy usando un tokenbearer por el momento
  String tokenUser = "";
  List tiles = [];

  @override
  void initState() {
    super.initState();
    // getInfoUser();
    final myDuctFormProvider =
        Provider.of<DuctFormProvider>(context, listen: false);

    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);

    myDuctFormProvider.getDataTable(myUserAuthProvider.getTokenUser());

    // tiles = myDuctFormProvider.dataTabla.map((element) {
    //   return ListTile(
    //     title: Text('ID: ${element['id']}, User ID: ${element['user_id']}'),
    //   );
    // }).toList();

    // tiles.forEach((tile) {
    //   print(tile.title);
    // });
  }

  void _showUserDataDialog(BuildContext context) {
    var userInfo = context.read<UserAuthProvider>();
    TextEditingController nameController =
        TextEditingController(text: userInfo.fullNameUser);
    TextEditingController phoneController =
        TextEditingController(text: userInfo.phoneUser);
    TextEditingController emailController =
        TextEditingController(text: userInfo.emailUser);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mis Datos'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: 'Correo electrónico'),
                ),
                const SizedBox(height: 20),
                const Text('Correo validado: Sí'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await context.read<UserAuthProvider>().updateInfoUser(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                    );
                setState(() {
                  fullName = nameController.text;
                  phone = phoneController.text;
                  email = emailController.text;
                });
                if (context.mounted) Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  //Mapa de converciones al español
  final Map<String, String> nameConversions = {
    'id': 'ID',
    'user_id': 'ID de usuario',
    'building_type_id': 'ID del tipo de edificio',
    'stops': 'Paradas',
    'height': 'Altura',
    'surface': 'Superficie total',
    'express_floors': 'Pisos express',
    'units_per_level_served': 'Unidades por nivel servido',
    'is_hospital': 'Es hospital',
    'capacity': 'Capacidad',
    'velocity': 'Velocidad',
    'safety_margin': 'Margen de seguridad',
    'door_width': 'Ancho de puerta',
    'door_technology': 'Tecnología de puerta',
    'index': 'Índice',
    'floors': 'Pisos',
    'percentage': 'Porcentaje',
    'total_population': 'Población total',
    'served_population': 'Población servida',
    'capacity_passengers': 'Capacidad de pasajeros',
    'capacity_kgs': 'Capacidad en kg',
    'capacity_platform_front': 'Capacidad de plataforma (frontal)',
    'capacity_platform_back': 'Capacidad de plataforma (trasera)',
    'capacity_cube_front': 'Capacidad de cubo (frontal)',
    'capacity_cube_back': 'Capacidad de cubo (trasera)',
    'capacity_door_width': 'Ancho de puerta de capacidad',
    'capacity_door_height': 'Altura de puerta de capacidad',
    'passengers': 'Pasajeros',
    'served_floors': 'Pisos servidos',
    'probable_stops': 'Paradas probables',
    'total_stops': 'Paradas totales',
    'average_jump': 'Salto promedio',
    'nominal_developed_velocity': 'Velocidad nominal desarrollada',
    'travel_time_for_partial_stops': 'Tiempo de viaje para paradas parciales',
    'travel_time_for_express_floors': 'Tiempo de viaje para pisos express',
    'acceleration_and_deceleration_time':
        'Tiempo de aceleración y desaceleración',
    'false_stops': 'Paradas falsas',
    'door_opening_and_closing_time': 'Tiempo de apertura y cierre de puerta',
    'passenger_entry_and_exit_time': 'Tiempo de entrada y salida de pasajeros',
    'leveling_time': 'Tiempo de nivelación',
    'recovery_time': 'Tiempo de recuperación',
    'total_time': 'Tiempo total',
    'passengers_to_be_transported': 'Pasajeros a ser transportados',
    'cabins_required': 'Cabinas requeridas',
    'waiting_interval': 'Intervalo de espera',
    'created_at': 'Creado en',
    'updated_at': 'Actualizado en',
  };

  Future<dynamic> getInfoOfTraficStudyById(String id) async {
    String apiUrl = 'https://dev.ktel.pe/api/elevator-calculations/$id';
    final myToken =
        Provider.of<UserAuthProvider>(context, listen: false).getTokenUser();

    try {
      http.Response response = await http.get(Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer $myToken'});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {

        // return ListView(
        //   children: [
        //     AlertDialog(
        //       title: Text("Información"),
        //       content: Center(
        //         child: DataTable(
        //           dataRowMaxHeight: double.infinity,
        //           columns: const [
        //             DataColumn(label: Text('Variable')),
        //             DataColumn(label: Text('Valor')),
        //           ],
        //           rows: data.entries.map<DataRow>((entry) {
        //             String key = entry.key;
        //             if (nameConversions.containsKey(key)) {
        //               key = nameConversions[key]!;
        //             } else {
        //               key = key.replaceAll("_", " ");
        //             }
        //             return DataRow(cells: [
        //               DataCell(Container(width: 100, child: Text(key))),
        //               DataCell(
        //                 Container(
        //                   width: 100,
        //                   child: Text(
        //                     entry.value.toString(),
        //                   ),
        //                 ),
        //               ),
        //             ]);
        //           }).toList(),
        //         ),
        //       ),
        //       actions: <Widget>[
        //         TextButton(
        //           child: Text("Cerrar"),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     ),
        //   ],
        // );
        // },
        // );
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el getInfoOfTraficStudyById() $e');
    }
  }

  List<Card> buildListTiles(DuctFormProvider valueProvider) {
    return valueProvider.dataTabla.map((dataItem) {
      return Card(
        child: ListTile(
          title: Text('ID: ${dataItem['id']}'),
          subtitle: Text('User ID: ${dataItem['user_id']}'),
          onTap: () async {
            var infoOfQuote = await getInfoOfTraficStudyById(
              dataItem['id'].toString(),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    QuoteDetail(quoteDetailModel: infoOfQuote),
              ),
            );
            //! Lo de abajo funciona, pero no es lo que quiero
            // await getInfoOfTraficStudyById(
            //   dataItem['id'].toString(),
            // );
          },
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final myUserAuthProvider =
                  Provider.of<UserAuthProvider>(context, listen: false);
              await valueProvider.deleteRowFromTable(
                  dataItem['id'].toString(), myUserAuthProvider.getTokenUser());
              valueProvider.dataTabla
                  .removeWhere((item) => item['id'] == dataItem['id']);
            },
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserAuthProvider, DuctFormProvider>(
      builder: (context, valueAuthProvider, valueDuctProvider, child) =>
          Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blue[900],
          elevation: 5.0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: Text(
            'Ascensores',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: buildListTiles(valueDuctProvider),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DuctCalculationPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(13, 71, 161, 1),
                  image: DecorationImage(
                    image: AssetImage('images/ascensor_background_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                accountName: Text(valueAuthProvider.fullNameUser),
                accountEmail: Text(valueAuthProvider.emailUser),
                currentAccountPicture: CircleAvatar(
                  //TODO, at the beginning the user is null so it produces an error, fix it in auth provider
                  child: Text(valueAuthProvider.fullNameUser[0].toUpperCase()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: const Text('Mis Datos'),
                onTap: () {
                  _showUserDataDialog(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.file_copy),
                title: const Text('Terminos y condiciones'),
                onTap: () {
                  _showUserDataDialog(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Salir'),
                onTap: () async {
                  await valueAuthProvider.logOutUser();
                  if (mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card generateQuoteCard(
      String titleQuote, String subtitleQuote, onDeleteQuote, onTapQuote) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.elevator),
        title: Text('$titleQuote'),
        subtitle: Text('$subtitleQuote'),
        trailing:
            IconButton(icon: Icon(Icons.delete), onPressed: onDeleteQuote),
        onTap: () => onTapQuote(),
      ),
    );
  }
}

class CardInfo {
  String title;
  String subtitle;
  CardInfo(this.title, this.subtitle);
}
