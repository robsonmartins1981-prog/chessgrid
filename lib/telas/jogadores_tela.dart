// lib/telas/jogadores_tela.dart

import 'package:flutter/material.dart';

// Classe de modelo para representar um jogador
class Jogador {
  final String nome;
  final String? email;
  final String? rating;
  final String? titulo;
  final String? clube;
  final String? telefone;
  final String? dataNascimento;
  final String? nacionalidade;
  final String? observacoes;
  final String? fideId;

  Jogador({
    required this.nome,
    this.email,
    this.rating,
    this.titulo,
    this.clube,
    this.telefone,
    this.dataNascimento,
    this.nacionalidade,
    this.observacoes,
    this.fideId,
  });
}

class JogadoresTela extends StatefulWidget {
  const JogadoresTela({super.key});

  @override
  State<JogadoresTela> createState() => _JogadoresTelaState();
}

class _JogadoresTelaState extends State<JogadoresTela> {
  // Lista para armazenar os jogadores. Começa vazia.
  final List<Jogador> _jogadores = [];

  void _showAddPlayerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: _AdicionarJogadorFormulario(
            onSave: (newJogador) {
              setState(() {
                _jogadores.add(newJogador);
              });
            },
          ),
        );
      },
    );
  }

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
                    onPressed: _showAddPlayerDialog,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _PlayerStatCard(title: 'Total', count: _jogadores.length, icon: Icons.person, color: Colors.blue),
              _PlayerStatCard(title: 'Ativos', count: _jogadores.length, icon: Icons.person_add_alt_1, color: Colors.green),
              _PlayerStatCard(title: 'Com Título', count: 0, icon: Icons.shield, color: Colors.purple),
              _PlayerStatCard(title: 'Rating Médio', count: 0, icon: Icons.star, color: Colors.orange),
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
            child: _jogadores.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Center(
                      child: Text('Nenhum jogador inscrito.', style: TextStyle(color: Colors.grey)),
                    ),
                  )
                : DataTable(
                    columns: const [
                      DataColumn(label: Text('Nome')),
                      DataColumn(label: Text('Rating')),
                      DataColumn(label: Text('Ações')),
                    ],
                    rows: _jogadores
                        .map((jogador) => DataRow(
                              cells: [
                                DataCell(Text(jogador.nome)),
                                DataCell(Text(jogador.rating ?? 'N/A')),
                                DataCell(Row(
                                  children: [
                                    TextButton(onPressed: () {}, child: const Text('Editar')),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ],
                                )),
                              ],
                            ))
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

// ----- Widgets de Apoio -----
class _AdicionarJogadorFormulario extends StatefulWidget {
  final Function(Jogador) onSave;

  const _AdicionarJogadorFormulario({super.key, required this.onSave});

  @override
  State<_AdicionarJogadorFormulario> createState() => _AdicionarJogadorFormularioState();
}

class _AdicionarJogadorFormularioState extends State<_AdicionarJogadorFormulario> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedTitle;
  
  final TextEditingController _fideIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _clubeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _nacionalidadeController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();

  final List<String> _titulos = ['GM', 'IM', 'FM', 'CM', 'WGM', 'WIM', 'WFM', 'WCM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Adicionar Novo Jogador', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const Divider(height: 32),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _fideIdController,
                  decoration: InputDecoration(
                    labelText: 'Buscar por ID FIDE (opcional)',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome Completo *',
                          hintText: 'Ex: Magnus Carlsen',
                        ),
                        validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'jogador@email.com',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ratingController,
                        decoration: const InputDecoration(
                          labelText: 'Rating',
                          hintText: 'Ex: 1800',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Título'),
                        value: _selectedTitle,
                        items: _titulos.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTitle = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _clubeController,
                        decoration: const InputDecoration(
                          labelText: 'Clube',
                          hintText: 'Ex: Clube de Xadrez Central',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _telefoneController,
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                          hintText: '(11) 99999-9999',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dataNascimentoController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Data de Nascimento',
                          hintText: 'dd/mm/aaaa',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _nacionalidadeController,
                        decoration: const InputDecoration(
                          labelText: 'Nacionalidade',
                          hintText: 'Ex: Brasil',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _observacoesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Observações',
                    hintText: 'Observações adicionais sobre o jogador...',
                  ),
                ),
                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final novoJogador = Jogador(
                            nome: _nameController.text,
                            email: _emailController.text,
                            rating: _ratingController.text,
                            titulo: _selectedTitle,
                            clube: _clubeController.text,
                            telefone: _telefoneController.text,
                            dataNascimento: _dataNascimentoController.text,
                            nacionalidade: _nacionalidadeController.text,
                            observacoes: _observacoesController.text,
                          );
                          widget.onSave(novoJogador);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Adicionar Jogador'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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