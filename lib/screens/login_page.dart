import 'dart:convert';

import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/register_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool showPasswordInput = false;
  bool rememberPassword = false;
  bool showPassword = false;
  bool showNewCreatedPassword = false;
  bool isNewUser = false;
  bool showErrorMessageEmail = false;

// Método para verificar si un usuario existe o no (simulado)
  Future<bool> verifyUser(String email) async {
    // URL del endpoint
    const String apiUrl = 'https://dev.ktel.pe/api/check-email';

    // Cuerpo de la solicitud HTTP
    final Map<String, String> data = {
      'email': email,
    };

    // Realizar la solicitud HTTP
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );
      if (response.statusCode == 200) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  bool verifyEmail() {
    // Lógica para verificar si el usuario verifico su correo o no
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //=============================
                //Login de usuario
                //=============================
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Image(
                      width: 150.0,
                      image: AssetImage('images/isotipo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: 'Ingresa tu correo electrónico',
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Visibility(
                            visible: showErrorMessageEmail,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Ingresa un correo válido.',
                                style: TextStyle(
                                  color: Color(0xFF782732),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !showPasswordInput && !isNewUser,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text('Continuar'),
                                onPressed: () async {
                                  String email = emailController.text.trim();
                                  // Verificar si el usuario existe o no
                                  bool usuarioExiste = await verifyUser(email);

                                  if (EmailValidator.validate(
                                      emailController.text)) {
                                    if (usuarioExiste) {
                                      // Usuario existe, mostrar campo de contraseña
                                      setState(() {
                                        showPasswordInput = true;
                                        showErrorMessageEmail = false;
                                      });
                                    } else {
                                      //Usuario crea su contraseña
                                      setState(() {
                                        isNewUser = true;
                                        showErrorMessageEmail = false;
                                      });
                                    }
                                  } else {
                                    print("El email no es valido");
                                    setState(() {
                                      showErrorMessageEmail = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: showPasswordInput,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                  controller: passwordController,
                                  obscureText: !showPassword,
                                  decoration: InputDecoration(
                                    labelText: 'Ingresa tu contraseña',
                                    suffixIcon: IconButton(
                                      color: Colors.blueGrey,
                                      icon: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 18.0,
                                      width: 18.0,
                                      child: Checkbox(
                                        side: const BorderSide(),
                                        value: rememberPassword,
                                        onChanged: (newValue) {
                                          setState(() {
                                            rememberPassword = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    const Text("Recordar contraseña"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                //=============================
                                //Logica Login user
                                //=============================
                                ElevatedButton(
                                  
                                  child: const Text('Ingresar'),                                  
                                  onPressed: () async {
                                    String password =
                                        passwordController.text.trim();
                                    bool isPasswordCorrect =
                                        await valueProvider.verifyLogin(
                                            emailController.text, password);
                                    if (isPasswordCorrect) {
                                      // Password Correct

                                      if (verifyEmail()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                        );
                                      } else {
                                        //=============================
                                        //Logica Email Not Verified
                                        //=============================
                                      }
                                    } else {
                                      // Password Incorrect
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Contraseña incorrecta, intentalo nuevamente!')),
                                      );
                                    }
                                  },
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Lógica para manejar el evento de "¿Olvidaste tu contraseña?"
                                  },
                                  child: const Text(
                                    '¿Olvidaste tu contraseña?',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //=============================
                          //Registro de usuario
                          //=============================
                          Visibility(
                            visible: isNewUser,
                            child: TextField(
                              controller: newPasswordController,
                              obscureText: !showNewCreatedPassword,
                              decoration: InputDecoration(
                                labelText: 'Crea una contraseña',
                                suffixIcon: IconButton(
                                  color: Colors.blueGrey,
                                  icon: Icon(
                                    showNewCreatedPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showNewCreatedPassword =
                                          !showNewCreatedPassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: isNewUser,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text('Registrarme'),
                                onPressed: () {
                                  String email = emailController.text;
                                  String password = newPasswordController.text;

                                  if (password.length > 7) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(
                                            email: email, password: password),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'La contraseña debe tener al menos 8 caracteres')),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //=============================
                  //Logica boton Continuar
                  //=============================
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
