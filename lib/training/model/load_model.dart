class Load {
  final int id;
  final String unity;
  final int quantity;
  final double weight;

  Load.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        unity = json['unity'],
        quantity = json['quantity'],
        weight = json['weight'];
}
