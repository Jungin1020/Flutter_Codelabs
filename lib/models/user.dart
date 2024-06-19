class User {
  User({required this.id, required this.height, required this.weight});

  final int id;
  final double height;
  final double weight;

  User copyWith({int? id, double? height, double? weight}) {
    return User(
      id: id ?? this.id,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }
}
