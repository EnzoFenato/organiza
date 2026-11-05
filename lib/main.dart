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
      title: 'Organiza',
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

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organiza'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Olá! Vamos organizar seu dia?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Acompanhe suas tarefas em um só lugar.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),

            // Resumo das tarefas.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.assignment_outlined,
                    size: 40,
                    color: Colors.indigo,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resumo do dia',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Você possui 3 tarefas pendentes.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Minhas tarefas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            const Card(
              child: ListTile(
                leading: Icon(Icons.radio_button_unchecked),
                title: Text('Estudar Flutter'),
                subtitle: Text('Revisar os conceitos de interface'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.radio_button_unchecked),
                title: Text('Fazer a atividade'),
                subtitle: Text('Montar a página principal'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.radio_button_unchecked),
                title: Text('Enviar no GitHub'),
                subtitle: Text('Publicar a primeira parte do projeto'),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'O cadastro de tarefas será desenvolvido '
                            'nas próximas etapas.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Adicionar tarefa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}