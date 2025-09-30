import 'package:flutter/material.dart';

class NovoTorneioTela extends StatefulWidget {
  const NovoTorneioTela({super.key});

  @override
  State<NovoTorneioTela> createState() => _NovoTorneioTelaState();
}

class _NovoTorneioTelaState extends State<NovoTorneioTela> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeTorneioController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _localController = TextEditingController();
  final TextEditingController _maxParticipantesController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataTerminoController = TextEditingController();
  final TextEditingController _premiacaoController = TextEditingController();
  final TextEditingController _taxaInscricaoController = TextEditingController();

  final TextEditingController _arbitroPrincipalController = TextEditingController();
  final TextEditingController _diretorTorneioController = TextEditingController();
  final TextEditingController _operadorSistemaController = TextEditingController();
  final TextEditingController _emailContatoController = TextEditingController();
  final TextEditingController _telefoneContatoController = TextEditingController();

  final TextEditingController _observacoesController = TextEditingController();

  final List<String> _categorias = ['Absoluto', 'Feminino', 'Sub-18', 'Sub-16', 'Sub-14', 'Sub-12', 'Veteranos +50'];
  final List<String> _categoriasSelecionadas = ['Absoluto'];
  
  final List<String> _sistemas = ['Sistema Suíço', 'Round Robin'];
  String? _sistemaSelecionado = 'Sistema Suíço';

  final List<String> _modalidades = ['Individual', 'Por Equipe'];
  String? _modalidadeSelecionada = 'Individual';

  final List<String> _controles = ['Clássico', 'Rápido', 'Blitz'];
  String? _controleSelecionado = 'Clássico';
  final TextEditingController _numRodadasController = TextEditingController();
  final TextEditingController _incrementoController = TextEditingController();

  final List<String> _criteriosDesempate = ['Buchholz', 'Sonneborn-Berger', 'Confronto Direto', 'Progressivo', 'Número de Vitórias'];
  List<String> _criteriosSelecionados = ['Buchholz', 'Sonneborn-Berger'];


  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String item = _criteriosSelecionados.removeAt(oldIndex);
      _criteriosSelecionados.insert(newIndex, item);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Novo Torneio'),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          labelColor: Colors.green.shade800,
          indicatorColor: Colors.green.shade800,
          tabs: const [
            Tab(icon: Icon(Icons.description), text: 'Básico'),
            Tab(icon: Icon(Icons.gavel), text: 'Regras'),
            Tab(icon: Icon(Icons.groups), text: 'Equipe'),
            Tab(icon: Icon(Icons.access_time), text: 'Avançado'),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: TabBarView(
          children: [
            // Aba de Informações Básicas
            SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Informações Básicas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nomeTorneioController,
                      decoration: const InputDecoration(labelText: 'Nome do Torneio *', hintText: 'Ex: Copa Primavera de Xadrez 2024'),
                      validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descricaoController,
                      maxLines: 3,
                      decoration: const InputDecoration(labelText: 'Descrição', hintText: 'Descrição detalhada do torneio...'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _localController,
                            decoration: const InputDecoration(labelText: 'Local *', hintText: 'Local do torneio'),
                            validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _maxParticipantesController,
                            decoration: const InputDecoration(labelText: 'Máximo de Participantes', hintText: 'Ex: 64'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dataInicioController,
                            readOnly: true,
                            decoration: const InputDecoration(labelText: 'Data de Início *', hintText: 'dd/mm/aaaa', suffixIcon: Icon(Icons.calendar_today)),
                            onTap: () { /* TODO: Implementar seletor de data */ },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _dataTerminoController,
                            readOnly: true,
                            decoration: const InputDecoration(labelText: 'Data de Término', hintText: 'dd/mm/aaaa', suffixIcon: Icon(Icons.calendar_today)),
                            onTap: () { /* TODO: Implementar seletor de data */ },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _premiacaoController,
                            decoration: const InputDecoration(labelText: 'Premiação Total (R\$)', hintText: 'Ex: 5000'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _taxaInscricaoController,
                            decoration: const InputDecoration(labelText: 'Taxa de Inscrição (R\$)', hintText: 'Ex: 50'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('Categorias', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: _categorias.map((categoria) {
                        final isSelected = _categoriasSelecionadas.contains(categoria);
                        return FilterChip(
                          label: Text(categoria),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _categoriasSelecionadas.add(categoria);
                              } else {
                                _categoriasSelecionadas.remove(categoria);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Aba de Regras
            SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sistema e Regras', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Sistema de Torneio *'),
                          initialValue: _sistemaSelecionado,
                          items: _sistemas.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _sistemaSelecionado = newValue;
                            });
                          },
                          validator: (value) => value == null ? 'Campo obrigatório' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Modalidade *'),
                          initialValue: _modalidadeSelecionada,
                          items: _modalidades.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _modalidadeSelecionada = newValue;
                            });
                          },
                          validator: (value) => value == null ? 'Campo obrigatório' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _numRodadasController,
                          decoration: const InputDecoration(labelText: 'Número de Rodadas', hintText: 'Ex: 7'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Controle de Tempo'),
                          initialValue: _controleSelecionado,
                          items: _controles.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _controleSelecionado = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _incrementoController,
                    decoration: const InputDecoration(labelText: 'Incremento (segundos)', hintText: 'Ex: 30'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  const Text('Critérios de Desempate', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200, // Altura fixa para a lista reordenável
                    child: ReorderableListView(
                      onReorder: _onReorder,
                      children: _criteriosSelecionados.map((criterio) {
                        return ListTile(
                          key: ValueKey(criterio),
                          leading: const Icon(Icons.drag_handle),
                          title: Text(criterio),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _criteriosSelecionados.remove(criterio);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Aba de Equipe
            SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Equipe Organizadora', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _arbitroPrincipalController,
                          decoration: const InputDecoration(labelText: 'Árbitro Principal *', hintText: 'Nome do árbitro principal'),
                          validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _diretorTorneioController,
                          decoration: const InputDecoration(labelText: 'Diretor do Torneio', hintText: 'Nome do diretor'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _operadorSistemaController,
                          decoration: const InputDecoration(labelText: 'Operador de Sistema', hintText: 'Nome do operador'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _emailContatoController,
                          decoration: const InputDecoration(labelText: 'Email de Contato', hintText: 'contato@torneio.com'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _telefoneContatoController,
                    decoration: const InputDecoration(labelText: 'Telefone de Contato', hintText: '(11) 99999-9999'),
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
            // Aba Avançado
            SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Configurações Avançadas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _observacoesController,
                    maxLines: 5,
                    decoration: const InputDecoration(labelText: 'Observações Gerais', hintText: 'Observações especiais, regras adicionais, informações importantes...'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Torneio salvo!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
              ),
              child: const Text('Criar Torneio'),
            ),
          ],
        ),
      ),
    );
  }
}