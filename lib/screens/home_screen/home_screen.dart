import 'dart:convert';
import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/duct_calculation/elevator_sizing/select_dimensions_screen.dart';
import 'package:ascensores/screens/home_screen/quote_details.dart';
import 'package:ascensores/screens/projects_page/projects_page_screen.dart';
import 'package:ascensores/screens/quotes_screen/quotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'drawer/drawer_widget.dart';
import 'package:http/http.dart' as http;
import 'build_list_tiles.dart';

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
  // ! Estoy usando un tokenBearer por el momento
  String tokenUser = "";

  List listOfQuotes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchQuotes();
  }

  void fetchData() async {
    final myDuctFormProvider =
        Provider.of<DuctFormProvider>(context, listen: false);
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);

    await myDuctFormProvider.getDataTable(myUserAuthProvider.getTokenUser());
    await myUserAuthProvider.getInfoUser();
    setState(() {
      isLoading = false; // Set loading state to false when data is fetched
    });
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
    final String apiUrl = 'https://dev.ktel.pe/api/quotes';

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
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Capturar y mostrar cualquier excepción que ocurra durante la solicitud
      print('Excepción: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer2<UserAuthProvider, DuctFormProvider>(
        builder: (context, valueAuthProvider, valueDuctProvider, child) =>
            Scaffold(
          body: TabBarView(
            children: <Widget>[
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/fondo.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: ListView(
                            children: buildListTiles(valueDuctProvider, context)
                                    .isEmpty
                                ? [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'images/isotipo.png',
                                          width: 170,
                                          height: 170,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          "Aun no hay estudios de tráfico",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                    // Widget de imagen que indica que no hay nada
                                  ]
                                : buildListTiles(valueDuctProvider, context),
                          ),
                        ),
                      ),
                    ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          QuoteDetails(quote['id']),
                                    ),
                                  );
                                },
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await deleteQuote(quote['id'].toString());
                                    setState(() {
                                      listOfQuotes.remove(quote);
                                    });
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
                  text: "Estudios de tráfico",
                ),
                Tab(
                  text: "Cotizaciones",
                ),
              ],
            ),
            shadowColor: Colors.blue[900],
            elevation: 5.0,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: const Text(
              'Ascensores',
              style: TextStyle(color: Colors.white),
            ),
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            backgroundColor: Colors.orange[900],
            overlayColor: Colors.black87,
            iconTheme: const IconThemeData(color: Colors.white),
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                backgroundColor: Colors.orange[900],
                child: Icon(
                  Icons.description,
                  color: Colors.white,
                ),
                label: "Generar cotización",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuotesScreen(),
                    ),
                  ).then((value) => {
                        "LLamando a fetch data",
                        fetchData(),
                      });
                },
              ),
              SpeedDialChild(
                backgroundColor: Colors.orange[900],
                child: Icon(
                  Icons.analytics,
                  color: Colors.white,
                ),
                label: "Generar estudio de tráfico",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectDimensionsScreen(),
                    ),
                  ).then((value) => {
                        "LLamando a fetch data",
                        fetchData(),
                      });
                },
              ),
              SpeedDialChild(
                backgroundColor: Colors.orange[900],
                child: Icon(
                  Icons.work,
                  color: Colors.white,
                ),
                label: "Proyectos",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectsPageScreen(),
                    ),
                  ).then((value) => {
                        "LLamando a fetch data",
                        fetchData(),
                      });
                },
              ),
            ],
          ),
          drawer: drawerLeft(valueAuthProvider, context),
        ),
      ),
    );
  }
}
