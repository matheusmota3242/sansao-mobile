class TrainingReference {
  final int id;
  final String trainingTypeName;
  final DateTime start;

  TrainingReference.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        trainingTypeName = json['trainingTypeName'] as String,
        start = DateTime.parse(json['startTime']);
}
