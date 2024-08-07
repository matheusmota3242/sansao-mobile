import 'package:sansao_mobile/training/model/load_model.dart';

class TrainingItem {
  final int id;
  final List<Load> loads;
  final String? comment;

  TrainingItem.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        loads = (json['loads'] as List).map((e) => Load.fromJson(e)).toList(),
        comment = json['comment'];
}
