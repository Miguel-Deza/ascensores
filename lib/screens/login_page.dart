import 'package:ascensores/screens/home_screen.dart';
import 'package:ascensores/screens/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/register_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

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
  bool showErrorMessage = false;
  bool isNewUser = false;
  bool showErrorMessageEmail = false;

// Método para verificar si un usuario existe o no (simulado)
  bool verifyUser(String email) {
    // Lógica para verificar si el usuario existe o no
    return email.contains("@example");
  }

  Future<bool> verifyLogin(String email, String password) async {
    // URL de la API de inicio de sesión
    const String apiUrl = 'https://dev.ktel.pe/api/login';

    // Cuerpo de la solicitud con los parámetros de inicio de sesión
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  bool verifyEmail() {
    // Lógica para verificar si el usuario verifico su correo o no
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: AssetImage('images/isotipo-negro.png'),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Ingresa tu correo electrónico',
                  ),
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
                const SizedBox(height: 20),
                showPasswordInput
                    ? Column(
                        children: [
                          TextField(
                            controller: passwordController,
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              suffixIcon: IconButton(
                                color: Colors.white,
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
                          Visibility(
                            visible: showErrorMessage,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Contraseña incorrecta. Inténtalo de nuevo.',
                                style: TextStyle(
                                  color: Color(0xFF782732),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),

                const SizedBox(height: 20),

                Visibility(
                  visible: !showPasswordInput && !isNewUser,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String email = emailController.text.trim();

                        // Verificar si el usuario existe o no
                        bool usuarioExiste = verifyUser(email);

                        if (EmailValidator.validate(emailController.text)) {
                          print("El email es valido");

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
                            // Usuario no existe, redirigir a la pantalla de registro

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => RegisterPassword()),
                            // );
                          }
                        } else {
                          print("El email no es valido");
                          setState(() {
                            showErrorMessageEmail = true;
                          });
                        }
                      },
                      child: const Text('Continuar'),
                    ),
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
                        color: Colors.white,
                        icon: Icon(
                          showNewCreatedPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            showNewCreatedPassword = !showNewCreatedPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isNewUser,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String password = newPasswordController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RegisterPage(email: email, password: password),
                          ),
                        );
                      },
                      child: const Text('Registrarme'),
                    ),
                  ),
                ),
                //Si
                //Si no existe, entonces registro

                Visibility(
                  visible: showPasswordInput,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 18.0,
                            width: 18.0,
                            child: Checkbox(
                              side: const BorderSide(color: Colors.white),
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
                      ElevatedButton(
                        onPressed: () async {
                          // Redireccionar a la pantalla de verificación
                          String password = passwordController.text.trim();

                          // Verificar si la contrasena es correcta o no
                          bool passwordCorrect =
                              await verifyLogin(emailController.text, password);
                          print(passwordCorrect);

                          if (passwordCorrect) {
                            // Password Correct
                            print("Contraseña correcta");
                            setState(() {
                              showErrorMessage = false;
                            });

                            if (verifyEmail()) {
                              // Email Verified
                              print("Email verificado");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                    email: "admin@admin.com",
                                    newPassword: "admin",
                                    phone: "123456789",
                                    fullName: "Admin",
                                  ),
                                ),
                              );
                            } else {
                              // Email Not Verified
                              print("Email no verificado");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerifyPage(
                                    email: emailController.text,
                                    newPassword: passwordController.text,
                                    phone: "123456789",
                                    fullName: "Admin",
                                  ),
                                ),
                              );
                            }
                          } else {
                            // Password Incorrect
                            print("Contraseña incorrecta");
                            setState(() {
                              showErrorMessage = true;
                            });
                          }
                        },
                        child: const Text('Ingresar'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Lógica para manejar el evento de "¿Olvidaste tu contraseña?"
                        },
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
