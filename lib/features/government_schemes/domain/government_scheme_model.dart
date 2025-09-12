class GovernmentScheme {
  final String name;
  final String description;
  final String url;

  GovernmentScheme({
    required this.name,
    required this.description,
    required this.url,
  });

  factory GovernmentScheme.fromMap(Map<String, dynamic> map) {
    return GovernmentScheme(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
