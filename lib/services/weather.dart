import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

class WeatherModel {
  late double latitude;
  late double longitude;

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
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
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      'api.openweathermap.org',
      'data/2.5/weather',
      {
        'q': cityName,
        'units': 'metric',
        'appid': apiKey,
      },
    );

    print(networkHelper);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}
