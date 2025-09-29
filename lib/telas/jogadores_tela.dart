// lib/telas/jogadores_tela.dart

import 'package:flutter/material.dart';

class JogadoresTela extends StatelessWidget {
  const JogadoresTela({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Título da Página e Botões de Ação
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Base de Jogadores',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Gerencie a base global de jogadores.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implementar lógica de importação
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text('Importar'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implementar lógica de inscrição
                    },
                    icon: const Icon(Icons.person_add),
                    label: const Text('Adicionar Jogador'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Cards de Estatísticas
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _PlayerStatCard(title: 'Total', count: 17, icon: Icons.person, color: Colors.blue),
              _PlayerStatCard(title: 'Ativos', count: 15, icon: Icons.person_add_alt_1, color: Colors.green),
              _PlayerStatCard(title: 'Com Título', count: 12, icon: Icons.shield, color: Colors.purple),
              _PlayerStatCard(title: 'Rating Médio', count: 2415, icon: Icons.star, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 32),

          // Barra de Busca e Filtros
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por nome, ID FIDE, email...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Chip(label: Text('Todos')),
              const SizedBox(width: 8),
              const Chip(label: Text('Ativos')),
              const SizedBox(width: 8),
              const Chip(label: Text('Inativos')),
              const SizedBox(width: 8),
              const Chip(label: Text('Suspensos')),
            ],
          ),
          const SizedBox(height: 24),
          
          // Tabela de Jogadores
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: const Column(
              children: [
                ListTile(
                  title: Text('Lista de Jogadores', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text('Nenhum jogador inscrito.', style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----- Widgets de Apoio -----
class _PlayerStatCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const _PlayerStatCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(icon, color: color),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}