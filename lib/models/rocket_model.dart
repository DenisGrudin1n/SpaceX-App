class Rocket {
  final int id;
  final String name;
  final List<String> flickrImages;

  Rocket({
    required this.id,
    required this.name,
    required this.flickrImages,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      flickrImages: json['flickr_images'] != null
          ? List<String>.from(json['flickr_images'] ?? [])
          : [],
    );
  }
}
