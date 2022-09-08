class Character {
  final int id;
  final String name;
  final String thumbnail;
  final String? description;

  Character(
      {required this.id,
      required this.name,
      required this.thumbnail,
      required this.description});

  factory Character.fromJson(dynamic json) {
    return Character(
        id: json['id'] as int,
        name: json['title'] as String,
        thumbnail: json['cover_url'] as String,
        description: json['overview'] as String?);
  }

  static List<Character> characterFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Character.fromJson(data);
    }).toList();
  }
}
