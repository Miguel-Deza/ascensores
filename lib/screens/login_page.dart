import 'package:ascensores/screens/home_screen.dart';
import 'package:ascensores/screens/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPasswordInput = false;
  bool rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Hero(
            tag: "logo",
            child: Image(
              image: AssetImage('images/logo_texto.png'),
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
            ),
          ),
          const SizedBox(height: 20),
          showPasswordInput
              ? TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                )
              : Container(),
          const SizedBox(height: 20),
          Visibility(
            visible: !showPasswordInput,
            child: ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();

                // Verificar si el usuario existe o no
                bool usuarioExiste = verifyUser(email);

                if (usuarioExiste) {
                  // Usuario existe, mostrar campo de contraseña
                  setState(() {
                    showPasswordInput = true;
                  });
                } else {
                  // Usuario no existe, redirigir a la pantalla de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                }
              },
              child: const Text('Continuar'),
            ),
          ),
          Visibility(
            visible: showPasswordInput,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 24.0,
                      width: 20.0,
                      child: Checkbox(
                        value: rememberPassword,
                        onChanged: (newValue) {
                          setState(() {
                            rememberPassword = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    const Text("Recuérdame la contraseña"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Lógica para manejar el evento de "¿Olvidaste tu contraseña?"
                      },
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Redireccionar a la pantalla de verificación
                        String password = passwordController.text.trim();

                        // Verificar si la contrasena es correcta o no
                        bool passwordCorrect = verifyLogin("@", password);

                        if (passwordCorrect) {
                          // Password Correct
                          print("Contraseña correcta");

                          if (verifyEmail()) {
                            // Email Verified
                            print("Email verificado");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          } else {
                            // Email Not Verified
                            print("Email no verificado");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerifyPage(),
                              ),
                            );
                          }
                        } else {
                          // Password Incorrect
                          print("Contraseña incorrecta");
                        }
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Método para verificar si un usuario existe o no (simulado)
  bool verifyUser(String email) {
    // Lógica para verificar si el usuario existe o no
    return email.contains("@");
  }

  bool verifyLogin(String email, String password) {
    // Lógica para verificar si la contraseña es correcta o no
    return password == "123" && email.contains("@");
  }

  bool verifyEmail() {
    // Lógica para verificar si el usuario verifico su correo o no
    return true;
  }
}
