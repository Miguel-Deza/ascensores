import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';

void showUserDataDialog(
    BuildContext context, UserAuthProvider valueAuthProvider) {
  TextEditingController nameController =
      TextEditingController(text: valueAuthProvider.fullNameUser);
  TextEditingController phoneController =
      TextEditingController(text: valueAuthProvider.phoneUser);
  TextEditingController emailController =
      TextEditingController(text: valueAuthProvider.emailUser);

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
              const Text('Correo validado: No'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await valueAuthProvider.updateInfoUser(
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
