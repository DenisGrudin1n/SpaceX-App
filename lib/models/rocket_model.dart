class Rocket {
  final String rocketId;
  final String name;
  final List<String> flickrImages;

  Rocket({
    required this.rocketId,
    required this.name,
    required this.flickrImages,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      rocketId: json['rocket_id'] ?? '',
      name: json['name'] ?? '',
      flickrImages: json['flickr_images'] != null
          ? List<String>.from(json['flickr_images'] ?? [])
          : [],
    );
  }
}
