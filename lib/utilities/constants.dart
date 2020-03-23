import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kCityTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25.0,
  color: Color(0xffE2F1F1),
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kForecastTitleStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  color: Color(0xff868D94),
  decoration: TextDecoration.underline,
);

const kForecastTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xff546e7a),
  fontWeight: FontWeight.w400,
);

const kCoordsUrl =
    'http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=3a2f593fc43d25ae2cd09f0a4c24383d&units=metric';

const kCityUrl =
    'http://api.openweathermap.org/data/2.5/weather?q={city}&appid=3a2f593fc43d25ae2cd09f0a4c24383d&units=metric';

const kForecastByCoordsUrl =
    'http://api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid=3a2f593fc43d25ae2cd09f0a4c24383d&units=metric';

const kForecastByCityUrl =
    'http://api.openweathermap.org/data/2.5/forecast?q={city}&appid=3a2f593fc43d25ae2cd09f0a4c24383d&units=metric';

const kIconUrl = 'http://openweathermap.org/img/wn/{icon}.png';

const kCityTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kBackgroundColor = Color(0xff79ABAA);
