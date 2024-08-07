class TrainingReference {
  final int id;
  final String trainingTypeName;
  final String start;

  TrainingReference.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        trainingTypeName = json['trainingTypeName'] as String,
        start = json['startTime'];
}
