import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Pages/home.dart';
import 'package:weather_app/Pages/loading.dart';
import 'package:weather_app/Pages/location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/' :(context) => Loading(),
      '/home' :(context) => Home(),
      '/loading' : (context) => Loading(),
    },
  ));
}

