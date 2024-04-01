import 'dart:convert';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/create_project_page/get_general_data_screen.dart';
import 'package:ascensores/screens/home_screen/quotes/quote_details.dart';

import 'package:ascensores/screens/quotes_screen/quotes_screen.dart';
import 'package:ascensores/screens/home_screen/studies/study_details.dart';
import 'package:ascensores/screens/trafic_study/elevator_sizing/select_dimensions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'drawer/drawer_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isLoading = true;

class _HomeScreenState extends State<HomeScreen> {
  String? fullName;
  String? phone;
  String? email;
  String tokenUser = "";

  List listOfQuotes = [];
  List listOfStudies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchQuotes();
    getStudies();
  }

  void fetchData() async {
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    await myUserAuthProvider.getInfoUser();
    setState(() {
      isLoading = false; // Set loading state to false when data is fetched
    });
  }

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

  Future<void> getStudies() async {
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerToken = myUserAuthProvider.getTokenUser();
    try {
      final response = await http.get(
          Uri.parse('https://dev.ktel.pe/api/elevator-calculations'),
          headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        final List<dynamic> parsedData = json.decode(response.body);
        // Iterar sobre los datos y obtener solo los campos seleccionados
        for (final item in parsedData) {
          final int buildingTypeId = item[
              'building_type_id']; // Obtener el ID del tipo de edificio como un entero
          final String createdAt =
              item['created_at']; // Obtener la fecha de creación
          final int id = item['id']; // Obtener el ID del estudio

          // Obtener el texto correspondiente al buildingType del mapa testBuildingUseDropdownList
          final String buildingTypeText = testBuildingUseDropdownList.entries
              .firstWhere((entry) => entry.value == buildingTypeId.toString(),
                  orElse: () => const MapEntry('', ''))
              .key;

          final Map<String, dynamic> selectedFields = {
            'buildingType': buildingTypeText,
            'createdAt': createdAt,
            'id': id,
          };
          setState(() {
            listOfStudies.add(selectedFields);
          });
        }
      } else {
        debugPrint('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error en el getDataTable: $e');
    }
  }

  Future<void> deleteStudy(String indexToDelete) async {
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerToken = myUserAuthProvider.getTokenUser();
    String apiUrl =
        'https://dev.ktel.pe/api/elevator-calculations/$indexToDelete';
    try {
      http.Response response = await http.delete(Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        debugPrint("Eliminado con éxito");
      } else {
        debugPrint('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error en el deleteRowFromTable: $e');
    }
  }

  Future<void> deleteQuote(String id) async {
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerToken = myUserAuthProvider.getTokenUser();
    final String apiUrl = 'https://dev.ktel.pe/api/quotes/$id';
    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // Mostrar el cuerpo de la respuesta
        debugPrint("Cotización eliminada");
      } else {
        debugPrint('Error al eliminar cotización: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepción: $e');
    }
  }

  void fetchQuotes() async {
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerToken = myUserAuthProvider.getTokenUser();
    const String apiUrl = 'https://dev.ktel.pe/api/quotes';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
      );
      // Verificar si la respuesta fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // Mostrar el cuerpo de la respuesta
        final List parsedData =
            (json.decode(response.body) as Map<String, dynamic>)
                .values
                .toList();
        // Iterar sobre los datos y obtener solo los campos seleccionados
        for (final item in parsedData) {
          final Map<String, dynamic> selectedFields = {
            'id': item['id'],
            'project': item['project'],
            'description': item['description'],
          };

          listOfQuotes.add(selectedFields);
        }
      } else {
        // Si la respuesta no fue exitosa, mostrar el código de estado
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Capturar y mostrar cualquier excepción que ocurra durante la solicitud
      debugPrint('Excepción: $e');
    }
  }

  Future<dynamic> getInfoOfTraficStudyById(
      String id, BuildContext context) async {
    String apiUrl = 'https://dev.ktel.pe/api/elevator-calculations/$id';
    final myToken =
        Provider.of<UserAuthProvider>(context, listen: false).getTokenUser();
    try {
      http.Response response = await http.get(Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer $myToken'});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      debugPrint('Error en el getInfoOfTraficStudyById() $e');
    }
  }

  Future<dynamic> getInfoOfQuoteById(String id, BuildContext context) async {
    final String apiUrl = 'https://dev.ktel.pe/api/quotes/$id';
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerToken = myUserAuthProvider.getTokenUser();
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
      );
      // Verificar si la respuesta fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      debugPrint('Excepción: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<UserAuthProvider>(
        builder: (context, valueAuthProvider, child) => Scaffold(
          body: TabBarView(
            children: <Widget>[
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ListView(
                          children: listOfStudies.isEmpty
                              ? [
                                  // Widget de imagen que indica que no hay nada
                                  Image.asset(
                                    'images/nodata.png',
                                    width: 500,
                                    height: 500,
                                    fit: BoxFit.contain,
                                  ),
                                ]
                              : listOfStudies.map((study) {
                                  return Card(
                                    child: ListTile(
                                      title: Text('${study['buildingType']}'),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                              Icons.calendar_month_outlined),
                                          const SizedBox(width: 5),
                                          Text(
                                            DateFormat('dd/MM/yyyy').format(
                                                DateTime.parse(
                                                        study['createdAt'])
                                                    .toLocal()),
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.access_time),
                                          const SizedBox(width: 5),
                                          Text(
                                            DateFormat('hh:mm a').format(
                                                DateTime.parse(
                                                        study['createdAt'])
                                                    .toLocal()),
                                          ),
                                        ],
                                      ),
                                      onTap: () async {
                                        var infoStudy =
                                            await getInfoOfTraficStudyById(
                                                study['id'].toString(),
                                                context);
                                        if (context.mounted) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StudyDetails(
                                                      studyData: infoStudy),
                                            ),
                                          );
                                        }
                                      },
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () async {
                                          Alert(
                                            context: context,
                                            type: AlertType.warning,
                                            title: "Eliminar",
                                            desc:
                                                "¿Está seguro de eliminar el estudio de tráfico?",
                                            buttons: [
                                              DialogButton(
                                                onPressed: () {
                                                  Navigator.pop(context,
                                                      false); // Return false if canceled
                                                },
                                                width: 120,
                                                color: Colors.orange[900],
                                                child: const Text(
                                                  "Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              DialogButton(
                                                onPressed: () async {
                                                  await deleteStudy(
                                                      study['id'].toString());
                                                  setState(() {
                                                    listOfStudies.remove(study);
                                                  });
                                                  if (context.mounted) {
                                                    Navigator.pop(
                                                        context, true);
                                                  } // Return true if confirmed
                                                },
                                                width: 120,
                                                color: Colors.orange[900],
                                                child: const Text(
                                                  "Eliminar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ).show();
                                        },
                                      ),
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ListView(
                          children: listOfQuotes.isEmpty
                              ? [
                                  // Widget de imagen que indica que no hay nada
                                  Image.asset(
                                    'images/nodata.png',
                                    width: 500,
                                    height: 500,
                                    fit: BoxFit.contain,
                                  ),
                                ]
                              : listOfQuotes.map((quote) {
                                  return Card(
                                    child: ListTile(
                                      title: Text(quote['project']),
                                      subtitle: Text(quote['description']),
                                      onTap: () async {
                                        var infoQuote =
                                            await getInfoOfQuoteById(
                                                quote['id'].toString(),
                                                context);

                                        if (context.mounted) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  QuoteDetails(
                                                      dataQuote: infoQuote),
                                            ),
                                          );
                                        }
                                      },
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () async {
                                          Alert(
                                            context: context,
                                            type: AlertType.warning,
                                            title: "Eliminar",
                                            desc:
                                                "¿Está seguro de eliminar el estudio de tráfico?",
                                            buttons: [
                                              DialogButton(
                                                onPressed: () {
                                                  Navigator.pop(context,
                                                      false); // Return false if canceled
                                                },
                                                width: 120,
                                                color: Colors.orange[900],
                                                child: const Text(
                                                  "Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              DialogButton(
                                                onPressed: () async {
                                                  await deleteQuote(
                                                      quote['id'].toString());
                                                  setState(() {
                                                    listOfQuotes.remove(quote);
                                                  });
                                                  if (context.mounted) {
                                                    Navigator.pop(
                                                        context, true);
                                                  }
                                                },
                                                width: 120,
                                                color: Colors.orange[900],
                                                child: const Text(
                                                  "Eliminar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ).show();
                                        },
                                      ),
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
            ],
          ),
          appBar: AppBar(
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "PROYECTOS",
                ),
                Tab(
                  text: "COTIZACIONES",
                ),
              ],
            ),
            shadowColor: Colors.blue[900],
            elevation: 5.0,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: const Text(
              'ASCENSORES',
              style: TextStyle(color: Colors.white),
            ),
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            backgroundColor: Colors.orange[900],
            overlayColor: Colors.black87,
            iconTheme: const IconThemeData(color: Colors.white),
            shape: const CircleBorder(),
            children: [
              SpeedDialChild(
                backgroundColor: Colors.orange[900],
                child: const Icon(
                  Icons.description,
                  color: Colors.white,
                ),
                label: "NUEVA COTIZACIÓN",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuotesScreen(),
                    ),
                  ).then((value) => {
                        "LLamando a fetch data",
                        fetchData(),
                      });
                },
              ),
              SpeedDialChild(
                backgroundColor: Colors.orange[900],
                child: const Icon(
                  Icons.analytics,
                  color: Colors.white,
                ),
                label: "NUEVO PROYECTO",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GetGeneralDataScreen(),
                    ),
                  ).then((value) => {
                        "LLamando a fetch data",
                        fetchData(),
                      });
                },
              ),
              // SpeedDialChild(
              //   backgroundColor: Colors.orange[900],
              //   child: const Icon(
              //     Icons.work,
              //     color: Colors.white,
              //   ),
              //   label: "Proyectos",
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const ProjectsPageScreen(),
              //       ),
              //     ).then((value) => {
              //           "LLamando a fetch data",
              //           fetchData(),
              //         });
              //   },
              // ),
            ],
          ),
          drawer: drawerLeft(valueAuthProvider, context),
        ),
      ),
    );
  }
}
