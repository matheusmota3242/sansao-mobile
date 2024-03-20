import 'package:sansao_mobile/training/model/training_model.dart';

class TrainingDetail {
  final String trainingTypeName;
  final Training training;

  TrainingDetail.fromJson(Map<String, dynamic> json)
      : trainingTypeName = json['trainingTypeName'],
        training = json['training'];
}
