import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'show_user_data_dialog.dart';

Drawer drawerLeft(UserAuthProvider valueAuthProvider, BuildContext context) {
  return Drawer(
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
            showUserDataDialog(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.file_copy),
          title: const Text('Terminos y condiciones'),
          onTap: () {
            showUserDataDialog(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: const Text('Salir'),
          onTap: () async {
            await valueAuthProvider.logOutUser();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    ),
  );
}
