import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

class WeatherModel {
  late double latitude;
  late double longitude;

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.getLatitude();
    longitude = location.getLongitude();

    NetworkHelper networkHelper = NetworkHelper(
      'api.openweathermap.org',
      'data/2.5/weather',
      {
        'lat': latitude.toString(),
        'units': 'metric',
        'lon': longitude.toString(),
        'appid': apiKey,
      },
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) {
    //     return LocationScreen(weatherData);
    //   }),
    // );
  }
}
