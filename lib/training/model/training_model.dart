import 'training_item_model.dart';

class Training {
  final int id;
  final List<TrainingItem> trainingItems;
  final String startTime;
  final String endTime;

  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        trainingItems = (json['trainingItens'] as List)
            .map((e) => TrainingItem.fromJson(e))
            .toList(),
        startTime = json['startTime'],
        endTime = json['endTime'];
}
