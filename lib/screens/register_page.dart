import 'package:flutter/material.dart';
import 'package:ascensores/screens/verify_page.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
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
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombres completos',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Celular',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirmar contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías procesar los datos del formulario de registro.
                // Por simplicidad, solo navegaremos a la siguiente pantalla.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyPage(),
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
