import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';
import '../screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.currentWeather});

  final currentWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String city;
  String icon;
  String iconUrl;
  String description;
  int humidity;
  int windSpeed;
  int pressure;
  String conditions;
  int realfeel;
  int clouds;

  @override
  void initState() {
    super.initState();
    updateUI(this.widget.currentWeather);
  }

  void getWeather() async {
    // Use weather class to get weather data
    WeatherModel weatherModel = WeatherModel();
    try {
      var currentWeather = await weatherModel.getCurrentWeather();
      updateUI(currentWeather);
    } catch (e) {
      print(e);
    }
  }

  void getWeatherForCity(String city) async {
    // Use weather class to get weather data
    WeatherModel weatherModel = WeatherModel();
    try {
      var currentWeather = await weatherModel.getCurrentWeather(city: city);
      updateUI(currentWeather);
    } catch (e) {
      print(e);
    }
  }

  void updateUI(dynamic currentWeather) {
    setState(() {
      print(currentWeather);
      if (currentWeather != null) {
        double temp = currentWeather['main']['temp'].toDouble();
        temperature = temp.toInt();
        temp = currentWeather['main']['feels_like'].toDouble();
        realfeel = temp.toInt();
        icon = currentWeather['weather'][0]['icon'];
        iconUrl = kIconUrl.replaceFirst('{icon}', icon);
        description = currentWeather['weather'][0]['main'];
        conditions = currentWeather['weather'][0]['description'];
        city = currentWeather['name'];
        humidity = currentWeather['main']['humidity'];
        // Convert wind speed to kph
        windSpeed = (currentWeather['wind']['speed'] * 3.6).toInt();
        pressure = currentWeather['main']['pressure'];
        clouds = currentWeather['clouds']['all'];
      } else {
        temperature = 0;
        icon = '04d';
        iconUrl = kIconUrl.replaceFirst('{icon}', icon);
        city = 'Unknown';
        description = 'Error';
        conditions = '';
        humidity = 0;
        windSpeed = 0;
        pressure = 0;
        realfeel = 0;
        clouds = 0;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            getWeather();
                          },
                          child: Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var selectedCity = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CityScreen();
                            }));

                            if (selectedCity != null) {
                              getWeatherForCity(selectedCity);
                            }
                          },
                          child: Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 50.0,
                              ),
                              child: Text(
                                '$description',
                                textAlign: TextAlign.right,
                                style: kMessageTextStyle,
                              ),
                            ),
                            Text(
                              '$city',
                              textAlign: TextAlign.left,
                              style: kCityTextStyle,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '$temperature°',
                                    style: kTempTextStyle,
                                  ),
                                  Image.network(
                                    '$iconUrl',
                                    scale: 0.5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Conditions',
                                style: kForecastTitleStyle,
                              ),
                              Text(
                                '${conditions[0].toUpperCase()}${conditions.substring(1)}',
                                style: kForecastTextStyle,
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                'Humidity',
                                style: kForecastTitleStyle,
                              ),
                              Text(
                                '$humidity%',
                                style: kForecastTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'RealFeel',
                                style: kForecastTitleStyle,
                              ),
                              Text(
                                '$realfeel°',
                                style: kForecastTextStyle,
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                'Wind Speed',
                                style: kForecastTitleStyle,
                              ),
                              Text(
                                '$windSpeed kph',
                                style: kForecastTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Cloud Cover',
                                style: kForecastTitleStyle,
                              ),
                              Text(
                                '$clouds%',
                                style: kForecastTextStyle,
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                'Pressure',
                                style: kForecastTitleStyle,
                              ),
                              Text(
                                '$pressure mb',
                                style: kForecastTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
