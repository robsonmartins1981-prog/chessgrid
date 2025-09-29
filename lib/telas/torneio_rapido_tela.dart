// lib/telas/torneio_rapido_tela.dart

import 'package:flutter/material.dart';

class TorneioRapidoTela extends StatelessWidget {
  const TorneioRapidoTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Torneio Rápido'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Configurações Padrão',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'As seguintes configurações serão aplicadas automaticamente.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            
            // Cards com as configurações padrão
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.category),
                      title: Text('Categoria'),
                      subtitle: Text('Absoluta'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Sistema de Jogo'),
                      subtitle: Text('Suíço'),
                    ),
                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text('Ritmo de Jogo'),
                      subtitle: Text('20+0'),
                    ),
                    ListTile(
                      leading: Icon(Icons.looks_3),
                      title: Text('Número de Rodadas'),
                      subtitle: Text('5 Rodadas'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Botão para criar o torneio
            ElevatedButton(
              onPressed: () {
                // TODO: Implementar lógica de criação do torneio
                Navigator.of(context).pop(); // Volta para o dashboard
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Criar Torneio Rápido'),
            ),
          ],
        ),
      ),
    );
  }
}