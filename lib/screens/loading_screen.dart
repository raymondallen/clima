import 'package:flutter/material.dart';
import '../services/weather.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getWeather() async {
    // Use weather class to get weather data
    WeatherModel weatherModel = WeatherModel();
    try {
      var currentWeather = await weatherModel.getCurrentWeather();

      // Navigate to location screen and display weather
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          currentWeather: currentWeather,
        );
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.teal,
          size: 150.0,
        ),
      ),
    );
  }
}
