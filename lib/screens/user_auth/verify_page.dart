import 'package:ascensores/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({
    super.key,
  });

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
                  // Acción para reenviar correo de verificación
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
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
                ),
              ),
            ],
          ),
        ),
      ), // Acción para editar perfil
    );
  }
}
