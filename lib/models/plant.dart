class Plant {
  final String id;
  final String commonName;
  final String scientificName;
  final String family;
  final String imageUrl;
  final String description;
  final bool isEdible;
  final bool isMedicinal;

  Plant({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.family,
    required this.imageUrl,
    required this.description,
    required this.isEdible,
    required this.isMedicinal,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'].toString(),
      commonName: json['common_name'] as String? ?? 'Unknown',
      scientificName: json['scientific_name'] as String? ?? 'Unknown',
      family: json['family'] as String? ?? 'Unknown',
      imageUrl: json['image_url'] as String? ?? '', // Provide a default image URL if not available
      description: json['description'] as String? ?? 'No description available.',
      isEdible: json['edible'] as bool? ?? false,
      isMedicinal: json['medicinal'] as bool? ?? false,
    );
  }
}
