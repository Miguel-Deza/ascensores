import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación de Correo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Hero(
                tag: "logo",
                child: Image(
                  image: AssetImage('images/logo_texto.png'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Antes de continuar, por favor verifica tu dirección de correo electrónico haciendo clic en el enlace que acabamos de enviarte por correo electrónico. Si no recibiste el correo electrónico, con gusto te enviaremos otro.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción para reenviar correo de verificación
                },
                child: const Text('REENVIAR CORREO DE VERIFICACIÓN'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Editar Perfil',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      
                      // Acción para cerrar sesión
                    },
                    child: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // Acción para editar perfil
    );
  }
}
