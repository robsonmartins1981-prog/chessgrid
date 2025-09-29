// lib/telas/login_tela.dart

import 'package:flutter/material.dart';
import 'package:chessgrid/telas/main_tela.dart';

class LoginTela extends StatelessWidget {
  const LoginTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo e Título do App
              const Text(
                'ChessGrid',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Text(
                'Sistema de Gestão de Torneios',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 64),

              // Botão de Acesso como Convidado
              ElevatedButton.icon(
                onPressed: () {
                  // Navega para a tela principal do app (Dashboard)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainTela()),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Entrar como Convidado'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(250, 50),
                ),
              ),
              const SizedBox(height: 16),

              // Opções de Login Futuras
              const Text('ou', style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {
                  // TODO: Implementar lógica de login com e-mail
                },
                child: const Text('Fazer Login com E-mail'),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implementar lógica de login com Google/Apple
                },
                child: const Text('Login com Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}