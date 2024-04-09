import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String token = "";

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
    return Consumer<UserAuthProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Column(
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
                              SizedBox(
                                  width:
                                      4), // Espacio entre el icono y el texto
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
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Registrarse'),
                onPressed: () async {
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  if (await valueProvider.registerUser(
                      widget.email,
                      widget.password,
                      nameController.text,
                      phoneController.text)) {
                    debugPrint("Usuario registrado con éxito");
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString(
                        'token', valueProvider.getTokenUser());
                    if (context.mounted) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  } else {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fallo en el registro')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
