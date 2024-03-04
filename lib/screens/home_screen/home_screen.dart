import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/duct_calculation/duct_calculation_page.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserAuthProvider, DuctFormProvider>(
      builder: (context, valueAuthProvider, valueDuctProvider, child) =>
          Scaffold(
        body: Container(
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
                children: buildListTiles(valueDuctProvider, context),
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[900],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DuctCalculationPage(),
              ),
            ).then((value) => {
                  "LLamando a fetch data",
                  fetchData(),
                });
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: drawerLeft(valueAuthProvider, context),
      ),
    );
  }
}
