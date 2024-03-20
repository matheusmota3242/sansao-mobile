import 'training_item_model.dart';

class Training {
  final int id;
  final List<TrainingItem> trainingItems;
  final DateTime startTime;
  final DateTime endTime;

  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        trainingItems = json['trainingItems'],
        startTime = DateTime.parse(json['startTime']),
        endTime = DateTime.parse(json['endTime']);
}
