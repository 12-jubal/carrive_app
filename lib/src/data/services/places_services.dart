import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/helpers/api_helpers.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class PlaceService {
  // Singleton Pattern for easy access
  PlaceService._();

  static Future<List<PlaceSuggestions>> placeSuggestions(
      {required String place}) async {
    const apiKey = 'AIzaSyDn0io98bDR9ElSNEpRu42f8HfRqeikbV0';
    try {
      final response = await APIService.instance.request(
          myBaseUrl: 'https://maps.googleapis.com',
          endpoint: '/maps/api/place/autocomplete/json',
          DioMethod.get,
          param: {
            'input': place,
            'components': 'country:ca',
            'language': 'fr',
            'key': apiKey,
          });
      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var placesJson = jsonResponse['predictions'] as List;

        // Map the predictions JSON into a list of Prediction objects
        List<PlaceSuggestions> places = placesJson.map((pred) {
          return PlaceSuggestions.fromJson(pred);
        }).toList();

        return places;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<PlaceDetail> placeDetails({required String placeId}) async {
    const apiKey = 'AIzaSyDn0io98bDR9ElSNEpRu42f8HfRqeikbV0';
    try {
      final response = await APIService.instance.request(
        myBaseUrl: 'https://maps.googleapis.com',
        endpoint:
            '/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=$apiKey',
        DioMethod.get,
      );
      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var placeJson = jsonResponse;

        // Get the details of a place
        PlaceDetail placeDetail = PlaceDetail.fromJson(placeJson);

        return placeDetail;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<PlaceDistDur> placeDistance(
      {required PlaceDetail origins, required PlaceDetail destinations}) async {
    const apiKey = 'AIzaSyDn0io98bDR9ElSNEpRu42f8HfRqeikbV0';
    try {
      final response = await APIService.instance.request(
        myBaseUrl: 'https://maps.googleapis.com',
        endpoint:
            '/maps/api/distancematrix/json?origins=${origins.lat},${origins.lng}&destinations=${destinations.lat},${destinations.lng}&key=$apiKey',
        DioMethod.get,
      );
      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var placeJson = jsonResponse;

        // Get the distance between two places
        PlaceDistDur placeDistDur = PlaceDistDur.fromJson(placeJson);

        return placeDistDur;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
