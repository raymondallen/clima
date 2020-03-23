import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCurrentWeather({String city = ''}) async {
    String url;

    // Check if searching by city or coordinates
    if (city != '') {
      url = kCityUrl.replaceFirst('{city}', city);
    } else {
      // Get current location
      Location location = Location();
      await location.getCurrentLocation();

      // Construct api url
      url = kCoordsUrl
          .replaceFirst('{lat}', location.latitude.toString())
          .replaceFirst('{lon}', location.longitude.toString());
    }

    // Use networking class to get weather data
    Networking networking = Networking(url);
    try {
      var weatherData = await networking.get();
      return weatherData;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
