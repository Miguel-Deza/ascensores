import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/duct_calculation/elevator_sizing/select_dimensions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'drawer_widget.dart';
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

  @override
  void initState() {
    super.initState();
    fetchData();
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

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserAuthProvider, DuctFormProvider>(
      builder: (context, valueAuthProvider, valueDuctProvider, child) =>
          Scaffold(
        body: isLoading
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
                    padding: const EdgeInsets.all(30.0),
                    child: ListView(
                      children:
                          buildListTiles(valueDuctProvider, context).isEmpty
                              ? [
                                  // Widget de imagen que indica que no hay nada
                                  Image.asset(
                                    'images/nodata.png',
                                    width: 500,
                                    height: 500,
                                    fit: BoxFit.contain,
                                  ),
                                ]
                              : buildListTiles(valueDuctProvider, context),
                    ),
                  ),
                ),
              ),
        appBar: AppBar(
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
                print("hello");
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
                print("hello");
              },
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.orange[900],
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => SelectDimensionsScreen(),
        //       ),
        //     ).then((value) => {
        //           "LLamando a fetch data",
        //           fetchData(),
        //         });
        //   },
        //   child: const Icon(Icons.add, color: Colors.white),
        // ),

        drawer: drawerLeft(valueAuthProvider, context),
      ),
    );
  }
}
