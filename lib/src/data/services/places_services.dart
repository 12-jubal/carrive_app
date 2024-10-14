import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/helpers/api_helpers.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class PlaceService {
  // Singleton Pattern for easy access
  PlaceService._();

  static Future<List<Place>> placeSuggestions({required String place}) async {
    const apiKey = 'AIzaSyDn0io98bDR9ElSNEpRu42f8HfRqeikbV0';
    try {
      final response = await APIService.instance.request(
        myBaseUrl: 'https://maps.googleapis.com',
        endpoint: '/maps/api/place/autocomplete/json?input=$place&'
            'components=country:cm&language=fr&key=$apiKey',
        DioMethod.get,
      );
      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        var placesJson = jsonResponse['predictions'] as List;

        // Map the predictions JSON into a list of Prediction objects
        List<Place> places = placesJson.map((pred) {
          return Place.fromJson(pred);
        }).toList();

        return places;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
