import 'package:flutter/material.dart';
import 'package:sansao_mobile/api/api_service.dart';

class TrainingList extends StatefulWidget {
  const TrainingList({super.key});

  @override
  State<TrainingList> createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo de Cláudia'),
        actions: [
          IconButton(
              onPressed: () => setState(() {}), icon: const Icon(Icons.update))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<dynamic>(
            future: ApiService.getTrainings(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (ConnectionState.waiting == snapshot.connectionState) {
                return const Center(child: LinearProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                return const Center(child: Text("Não há dados."));
              } else {
                List<dynamic> dados = snapshot.data;
                return ListView.builder(
                    itemCount: dados.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(dados[index]['trainingTypeName']),
                        ));
              }
            }),
      ),
    );
    ;
  }
}
