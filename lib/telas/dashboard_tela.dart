// lib/telas/dashboard_tela.dart

import 'package:flutter/material.dart';
import 'package:chessgrid/telas/torneios_tela.dart';
import 'package:chessgrid/telas/jogadores_tela.dart';
import 'package:chessgrid/telas/suporte_tela.dart';
import 'package:chessgrid/telas/novo_torneio_tela.dart';
import 'package:chessgrid/telas/configuracoes_tela.dart';

class DashboardTela extends StatelessWidget {
  const DashboardTela({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Dashboard', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const Text('Visão geral e acesso rápido às funcionalidades.', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 32),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _StatCard(title: 'Total', count: 2, icon: Icons.emoji_events, color: Colors.lightBlue),
              _StatCard(title: 'Planejados', count: 2, icon: Icons.calendar_month, color: Colors.orange),
              _StatCard(title: 'Em Andamento', count: 0, icon: Icons.check_circle, color: Colors.green),
              _StatCard(title: 'Finalizados', count: 0, icon: Icons.flag, color: Colors.red),
            ],
          ),
          const SizedBox(height: 32),

          Row(
            children: <Widget>[
              Expanded(
                child: _StyledActionCard(
                  title: 'Gerenciar Torneios',
                  subtitle: 'Crie, edite e acompanhe todos os seus torneios.',
                  icon: Icons.emoji_events,
                  actionText: 'Acessar Torneios',
                  cardColor: Colors.orange.shade600,
                  onPressed: () => _navigateTo(context, const TorneiosTela()),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _StyledActionCard(
                  title: 'Base de Jogadores',
                  subtitle: 'Gerencie sua base de dados global de jogadores.',
                  icon: Icons.group,
                  actionText: 'Gerenciar Jogadores',
                  cardColor: Colors.blue.shade600,
                  onPressed: () => _navigateTo(context, const JogadoresTela()),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _NewTournamentCard(
                  title: 'Novo Torneio Rápido',
                  subtitle: 'Comece a configurar um novo torneio agora mesmo.',
                  onPressed: () => _navigateTo(context, const NovoTorneioTela()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          const Text('Torneios Recentes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          const _RecentTournamentCard(
            title: 'Torneio de Sábado',
            subtitle: '21/01/2025 • Paranavaí',
            status: 'Planejado',
          ),
          const SizedBox(height: 8),
           const _RecentTournamentCard(
            title: 'Teste',
            subtitle: '23/09/2025 • Paranavaí',
            status: 'Planejado',
          ),
        ],
      ),
    );
  }
}
// ----- Widgets de Apoio (para reutilização de código) -----

class _StatCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const _StatCard({required this.title, required this.count, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28, color: color),
              const SizedBox(height: 16),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 4),
              Text(title, style: TextStyle(fontSize: 16, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}

class _StyledActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String actionText;
  final Color cardColor;
  final VoidCallback onPressed;

  const _StyledActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.actionText,
    required this.cardColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.white70)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: cardColor,
              ),
              child: Text(actionText),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewTournamentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const _NewTournamentCard({
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade600,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.add, size: 36, color: Colors.white),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.white70)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green.shade600,
              ),
              child: const Text('Criar Agora'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentTournamentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;

  const _RecentTournamentCard({
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            Row(
              children: <Widget>[
                Chip(
                  label: Text(status),
                  backgroundColor: Colors.blue.shade50,
                  labelStyle: TextStyle(color: Colors.blue.shade800),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}