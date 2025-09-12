class CropRecommendation {
  final String cropName;
  final String description;

  CropRecommendation({required this.cropName, required this.description});

  factory CropRecommendation.fromJson(Map<String, dynamic> json) {
    return CropRecommendation(
      cropName: json['cropName'],
      description: json['description'],
    );
  }
}
