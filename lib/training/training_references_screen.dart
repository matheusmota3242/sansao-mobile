import 'package:flutter/material.dart';
import 'package:sansao_mobile/api/api_response.dart';
import 'package:sansao_mobile/api/api_service.dart';
import 'package:sansao_mobile/training/model/training_reference_model.dart';
import 'package:sansao_mobile/widget/my_future_builder.dart';

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
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sansão',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.update),
          ),
        ],
      ),
      body: FutureBuilder<ApiResponse<List<TrainingReference>>>(
          future: ApiService.getTrainingReferences(),
          builder: (context, snapshot) {
            return MyFutureBuilder.getWidget(
              snapshot,
              snapshot.data != null && snapshot.data!.body != null
                  ? ListView.builder(
                      itemCount: snapshot.data!.body!.length,
                      itemBuilder: (context, index) {
                        TrainingReference? reference =
                            snapshot.data!.body![index];
                        return ListTile(
                          title: Text(reference.trainingTypeName,
                              style: textTheme.titleMedium),
                          subtitle: Text(reference.start.toString(),
                              style: textTheme.bodySmall),
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
                      })
                  : Container(),
            );
          }),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar')
      ]),
    );
  }
}
