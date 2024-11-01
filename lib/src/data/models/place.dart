class PlaceSuggestions {
  final String mainText;
  final String description;
  final String secondaryText;
  final List types;
  final String placeId;

  PlaceSuggestions({
    required this.mainText,
    required this.description,
    required this.secondaryText,
    required this.types,
    required this.placeId,
  });

  // A factory constructor that creates an instance of Place from JSON
  factory PlaceSuggestions.fromJson(Map<String, dynamic> json) {
    return PlaceSuggestions(
      mainText: json['structured_formatting']['main_text'],
      description: json['description'],
      secondaryText: json['structured_formatting']['secondary_text'],
      types: json['types'],
      placeId: json['place_id'],
    );
  }
}

class PlaceDetail {
  final double? lat;
  final double? lng;

  PlaceDetail({
    required this.lat,
    required this.lng,
  });

  // A factory constructor that creates an instance of Place from JSON
  factory PlaceDetail.fromJson(Map<String, dynamic> json) {
    return PlaceDetail(
      lat: json['result']['geometry']['location']['lat'],
      lng: json['result']['geometry']['location']['lng'],
    );
  }
}

class PlaceDistDur {
  final int distance;
  final int duration;

  PlaceDistDur({
    required this.distance,
    required this.duration,
  });

  // A factory constructor that creates an instance of Place from JSON
  factory PlaceDistDur.fromJson(Map<String, dynamic> json) {
    return PlaceDistDur(
      distance: json['rows'][0]['elements'][0]['distance']['value'],
      duration: json['rows'][0]['elements'][0]['duration']['value'],
    );
  }
}
