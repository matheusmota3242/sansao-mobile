import 'package:flutter/material.dart';
import 'package:sansao_mobile/api/api_response.dart';
import 'package:sansao_mobile/api/api_service.dart';
import 'package:sansao_mobile/training/model/training_reference_model.dart';

import 'training_detail_screen.dart';

class TrainingReferencesScreen extends StatefulWidget {
  const TrainingReferencesScreen({super.key});

  @override
  State<TrainingReferencesScreen> createState() =>
      _TrainingReferencesScreenState();
}

class _TrainingReferencesScreenState extends State<TrainingReferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sansão App'),
        actions: [
          IconButton(
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.update),
          ),
          IconButton(
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder<ApiResponse<List<TrainingReference>>>(
          future: ApiService.getTrainingReferences(),
          builder: (context, snapshot) {
            snapshot.data!.body.length;
            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Center(child: LinearProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Center(child: Text("Não há dados."));
            } else if (snapshot.hasError || snapshot.data!.hasError) {
              String message = snapshot.hasError
                  ? snapshot.error.toString()
                  : snapshot.data!.error;
              return Center(child: Text('Erro: $message'));
            } else {
              List<TrainingReference> references = snapshot.data!.body;

              return ListView.builder(
                  itemCount: snapshot.data!.body.length,
                  itemBuilder: (context, index) {
                    TrainingReference reference = references[index];
                    return ListTile(
                      title: Text(reference.trainingTypeName),
                      subtitle: Text(reference.start.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrainingDetailScreen(
                              id: reference.id,
                            ),
                          ),
                        );
                      },
                    );
                  });
            }
          }),
    );
  }
}
