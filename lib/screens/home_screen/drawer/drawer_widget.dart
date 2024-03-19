import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/user_auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../show_user_data_dialog.dart';

Drawer drawerLeft(UserAuthProvider valueAuthProvider, BuildContext context) {
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(13, 71, 161, 1),
            // image: DecorationImage(
            //   image: AssetImage('images/ascensor_background_image.jpg'),
            //   fit: BoxFit.cover,
            // ),
          ),
          accountName: Text(valueAuthProvider.fullNameUser),
          accountEmail: Text(valueAuthProvider.emailUser),
          currentAccountPicture: CircleAvatar(
            child: Text(valueAuthProvider.fullNameUser[0].toUpperCase()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Mis Datos'),
          onTap: () {
            showUserDataDialog(context, valueAuthProvider);
          },
        ),
        ListTile(
          leading: const Icon(Icons.file_copy),
          title: const Text('Términos y condiciones'),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return showTerminosyCondiciones(context);
              },
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Salir'),
          onTap: () async {
            await valueAuthProvider.logOutUser();
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove("token");
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false,
              );
            }
          },
        ),
      ],
    ),
  );
}

AlertDialog showTerminosyCondiciones(BuildContext context) {
  return AlertDialog(
    title: const Text('Términos y Condiciones'),
    content: const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estos son los términos y condiciones de uso para esta aplicación:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '1. Uso del Servicio\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat vehicula arcu, vel tristique turpis facilisis sit amet. Quisque malesuada est id malesuada suscipit.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '2. Propiedad Intelectual\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat vehicula arcu, vel tristique turpis facilisis sit amet. Quisque malesuada est id malesuada suscipit.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '3. Limitación de Responsabilidad\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat vehicula arcu, vel tristique turpis facilisis sit amet. Quisque malesuada est id malesuada suscipit.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '4. Modificaciones\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat vehicula arcu, vel tristique turpis facilisis sit amet. Quisque malesuada est id malesuada suscipit.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Aceptar'),
      ),
    ],
  );
}
