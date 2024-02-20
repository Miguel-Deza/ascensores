import 'package:ascensores/screens/home_screen.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatelessWidget {
  final String email;
  final String newPassword;
  final String phone;
  final String fullName;
  final String token;

  const VerifyPage(
      {super.key,
      required this.email,
      required this.newPassword,
      required this.phone,
      required this.fullName,
      required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Por favor verifica tu dirección de correo electrónico haciendo clic en el enlace que acabamos de enviarte por correo electrónico.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Correo: $email');
                  print('Contraseña: $newPassword');
                  print('Teléfono: $phone');
                  print('Nombre: $fullName');

                  // Acción para reenviar correo de verificación
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        email: email,
                        newPassword: newPassword,
                        phone: phone,
                        fullName: fullName,
                        token: token,
                      ),
                    ),
                  );
                },
                child: const Text('Continuar'),
              ),
              TextButton(
                onPressed: () {
                  // Acción para reenviar correo de verificación
                },
                child: const Text(
                  'Reenviar correo de verificación',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // Acción para editar perfil
    );
  }
}
