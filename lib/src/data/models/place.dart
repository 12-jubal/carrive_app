class Place {
  final String mainText;
  final String description;
  final String secondaryText;
  final List types;
  final String placeId;

  Place({
    required this.mainText,
    required this.description,
    required this.secondaryText,
    required this.types,
    required this.placeId,
  });

  // A factory constructor that creates an instance of Place from JSON
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      mainText: json['structured_formatting']['main_text'],
      description: json['description'],
      secondaryText: json['structured_formatting']['secondary_text'],
      types: json['types'],
      placeId: json['place_id'],
    );
  }
}
