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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool showPasswordInput = false;
  bool rememberPassword = false;
  bool showPassword = false;
  bool showNewCreatedPassword = false;
  bool isNewUser = false;
  bool showErrorMessageEmail = false;
  bool isNewCreatedPasswordGreatherThanEight = false;
  //

// Email of user exist?
  Future<bool> verifyUser(String email) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('https://dev.ktel.pe/api/check-email'),
        body: {'email': email},
      );
      return response.statusCode != 200;
    } catch (e) {
      return false;
    }
  }

// Logic for verify if user verify his email
  bool verifyEmail() {
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
                //Login of user
                children: [
                  newMethod(),
                  const SizedBox(
                    height: 30.0,
                  ),

                  //All the logic of login
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Ingresa tu correo electrónico',
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
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
                                  String email = _emailController.text.trim();
                                  // Verificar si el usuario existe o no
                                  bool usuarioExiste = await verifyUser(email);

                                  if (EmailValidator.validate(
                                      _emailController.text)) {
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
                                  controller: _passwordController,
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
                                        _passwordController.text.trim();
                                    bool isPasswordCorrect =
                                        await valueProvider.verifyLogin(
                                            _emailController.text, password);
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
                            child: Column(
                              children: [
                                TextField(
                                  controller: _newPasswordController,
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
                                Visibility(
                                  visible:
                                      isNewCreatedPasswordGreatherThanEight,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Mínimo 8 caracteres',
                                      style: TextStyle(
                                        color: Color(0xFF782732),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                  String email = _emailController.text;
                                  String password = _newPasswordController.text;

                                  if (password.length > 7) {
                                    setState(() {
                                      isNewCreatedPasswordGreatherThanEight =
                                          false;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(
                                            email: email, password: password),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      isNewCreatedPasswordGreatherThanEight =
                                          true;
                                    });
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

  //Metodos

  Padding newMethod() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Image(
        width: 150.0,
        image: AssetImage('images/isotipo.png'),
      ),
    );
  }
}
