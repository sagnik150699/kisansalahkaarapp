class PestAndDisease {
  final String name;
  final String description;
  final String remedy;
  final String imageUrl;

  PestAndDisease({
    required this.name,
    required this.description,
    required this.remedy,
    required this.imageUrl,
  });

  factory PestAndDisease.fromMap(Map<String, dynamic> map) {
    return PestAndDisease(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      remedy: map['remedy'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
