import 'package:flutter/material.dart';

class ConfiguracoesTela extends StatelessWidget {
  const ConfiguracoesTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações do Sistema')),
      body: const Center(child: Text('Esta é a tela de Configurações.')),
    );
  }
}