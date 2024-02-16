import 'package:ascensores/screens/home_screen.dart';
import 'package:ascensores/screens/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/register_page.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
  final TextEditingController newPasswordController = TextEditingController();
  bool showPasswordInput = false;
  bool rememberPassword = false;
  bool showPassword = false;
  bool showErrorMessage = false;
  bool newUser = false;
  bool showErrorMessageEmail = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Hero(
              tag: "logo",
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Image(
                  width: 150.0,
                  image: AssetImage('images/isotipo-negro.png'),
                ),
              ),
            ),
            TextFormField(
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
            Visibility(
              visible: newUser,
              child: TextField(
                controller: newPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Crea una contraseña',
                ),
                obscureText: true,
              ),
            ),
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
              visible: !showPasswordInput && !newUser,
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
                          newUser = true;
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

            Visibility(
              visible: newUser,
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
                            RegisterPage(email: email, newPassword: password),
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
                    onPressed: () {
                      // Redireccionar a la pantalla de verificación
                      String password = passwordController.text.trim();

                      // Verificar si la contrasena es correcta o no
                      bool passwordCorrect = verifyLogin("@", password);

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
    );
  }

// Método para verificar si un usuario existe o no (simulado)
  bool verifyUser(String email) {
    // Lógica para verificar si el usuario existe o no
    return email.contains("admin@admin");
  }

  bool verifyLogin(String email, String password) {
    // Lógica para verificar si la contraseña es correcta o no
    return password == "admin" && email.contains("@");
  }

  bool verifyEmail() {
    // Lógica para verificar si el usuario verifico su correo o no
    return true;
  }
}
