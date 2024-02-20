import 'package:flutter/material.dart';
import 'package:ascensores/screens/verify_page.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  final String email;
  final String password;

  const RegisterPage({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool showMessageIsNameEmpty = false;
  bool showMessageIsPhoneEmpty = false;
  bool showPassword = false;

  bool isPhoneEmpty() {
    if (phoneController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isNameEmpty() {
    if (nameController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombres completos',
              ),
            ),
            Visibility(
              visible: showMessageIsNameEmpty,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ingresa un nombre',
                  style: TextStyle(
                    color: Color(0xFF782732),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                    9), // Longitud del número de teléfono en Perú
              ],
              decoration: const InputDecoration(
                labelText: 'Celular',
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 4), // Espacio entre el icono y el texto
                    Text(' 🇵🇪 +51 '),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: showMessageIsPhoneEmpty,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ingresa un celular',
                  style: TextStyle(
                    color: Color(0xFF782732),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) {
                  setState(() {
                    showMessageIsNameEmpty = true;
                  });
                  return;
                }

                if (phoneController.text.isEmpty) {
                  setState(() {
                    showMessageIsPhoneEmpty = true;
                    showMessageIsNameEmpty = false;
                  });
                  return;
                }

                setState(() {
                  showMessageIsNameEmpty = false;
                  showMessageIsPhoneEmpty = false;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyPage(
                      email: widget.email,
                      newPassword: widget.password,
                      phone: phoneController.text,
                      fullName: nameController.text,
                    ),
                  ),
                );
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
