import 'package:flutter/material.dart';
import 'package:sansao_mobile/api/api_service.dart';

class TrainingDetailScreen extends StatelessWidget {
  const TrainingDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training'),
      ),
      body: FutureBuilder<dynamic>(
          future: ApiService.getTrainingById(id),
          builder: (_, AsyncSnapshot<dynamic> snapshot) {
            return Container(
              child: Text(''),
            );
          }),
    );
  }
}
