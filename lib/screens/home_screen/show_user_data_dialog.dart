import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showUserDataDialog(BuildContext context) {
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
              // setState(() {
              //   fullName = nameController.text;
              //   phone = phoneController.text;
              //   email = emailController.text;
              // });
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text('Guardar'),
          ),
        ],
      );
    },
  );
}
