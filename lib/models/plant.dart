class Plant {
  final String id;
  final String commonName;
  final String scientificName;
  final String watering;
  final String imageUrl;
  // final String description;
  // final bool isEdible;
  // final bool isMedicinal;

  Plant({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.watering,
    required this.imageUrl,
    // required this.description,
    // required this.isEdible,
    // required this.isMedicinal,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'].toString(),
      commonName: json['common_name'] as String? ?? 'Unknown',
      scientificName: json['scientific_name'][0] as String? ?? 'Unknown',
      watering: json['watering'] as String? ?? 'Unknown',
      imageUrl: null != json['default_image']&& null != json['default_image']['original_url']?json['default_image']['original_url']:'', // Provide a default image URL if not available
      // description: json['description'] as String? ?? 'No description available.',
      // isEdible: json['edible'] as bool? ?? false,
      // isMedicinal: json['medicinal'] as bool? ?? false,
    );
  }
}
