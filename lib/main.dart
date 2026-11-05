import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Organiza Receitas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final _formKey = GlobalKey<FormState>();
  final _pesquisaController = TextEditingController();

  String? _termoPesquisado;

  String _tratarTexto(String texto) {
    return texto.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  void _pesquisar() {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _termoPesquisado = null;
      });
      return;
    }

    setState(() {
      _termoPesquisado = _tratarTexto(_pesquisaController.text);
    });

    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organiza Receitas'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'O que vamos preparar?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pesquise uma receita pelo nome.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),

            // Campo de pesquisa de receitas.
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _pesquisaController,
                    decoration: const InputDecoration(
                      labelText: 'Nome da receita',
                      hintText: 'Ex.: bolo de cenoura',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      errorMaxLines: 3,
                    ),
                    textInputAction: TextInputAction.search,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: (valor) {
                      if (_tratarTexto(valor ?? '').isEmpty) {
                        return 'Digite o nome de uma receita, '
                            'não apenas espaços.';
                      }

                      return null;
                    },
                    onChanged: (_) {
                      if (_termoPesquisado != null) {
                        setState(() {
                          _termoPesquisado = null;
                        });
                      }
                    },
                    onFieldSubmitted: (_) => _pesquisar(),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _pesquisar,
                      icon: const Icon(Icons.search),
                      label: const Text('Pesquisar'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Mensagem exibida após uma pesquisa válida.
            if (_termoPesquisado != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pesquisa recebida!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Termo pesquisado: $_termoPesquisado',
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Os resultados das receitas serão '
                            'implementados nas próximas etapas.',
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}