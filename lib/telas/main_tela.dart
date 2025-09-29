// lib/telas/main_tela.dart

import 'package:flutter/material.dart';
import 'package:chessgrid/telas/dashboard_tela.dart';
import 'package:chessgrid/telas/torneios_tela.dart';
import 'package:chessgrid/telas/jogadores_tela.dart';
import 'package:chessgrid/telas/configuracoes_tela.dart';
import 'package:chessgrid/telas/suporte_tela.dart';

class MainTela extends StatefulWidget {
  const MainTela({super.key});

  @override
  State<MainTela> createState() => _MainTelaState();
}

class _MainTelaState extends State<MainTela> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardTela(),
    TorneiosTela(),
    JogadoresTela(),
    ConfiguracoesTela(),
    SuporteTela(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Painel de Navegação Lateral
          Container(
            width: 250,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Logo e Título do App
                Row(
                  children: [
                    Image.asset(
                      'assets/logo.png', // Substitua pelo caminho do seu arquivo de imagem
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    const Text('ChessGrid', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
                const Text('Sistema de Torneios', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 32),
                
                // Menu de Navegação
                const Text('MENU PRINCIPAL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.dashboard_outlined),
                  title: const Text('Dashboard'),
                  selected: _selectedIndex == 0,
                  selectedTileColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.emoji_events_outlined),
                  title: const Text('Torneios'),
                  selected: _selectedIndex == 1,
                  selectedTileColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group_outlined),
                  title: const Text('Jogadores'),
                  selected: _selectedIndex == 2,
                  selectedTileColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                const SizedBox(height: 24),
                const Text('SISTEMA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Configurações'),
                  selected: _selectedIndex == 3,
                  selectedTileColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent_outlined),
                  title: const Text('Suporte'),
                  selected: _selectedIndex == 4,
                  selectedTileColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                ),
                const Spacer(),
                const Divider(),
                const ListTile(
                  leading: CircleAvatar(child: Text('DR')),
                  title: Text('Organizador', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('CloudGrid MVP'),
                ),
              ],
            ),
          ),
          
          // Painel de Conteúdo Principal
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }
}