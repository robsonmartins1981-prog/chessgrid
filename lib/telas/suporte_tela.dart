import 'package:flutter/material.dart';

class SuporteTela extends StatelessWidget {
  const SuporteTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suporte e Ajuda')),
      body: const Center(child: Text('Esta é a tela de Suporte.')),
    );
  }
}