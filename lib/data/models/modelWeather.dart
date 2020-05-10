
import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  //Element of Weather Class
  final String cityName;
  final double tempC;
  final double tempF;
  final int pressure;
  final int humidity;
  final String weatherIcon;

  //Constructeur
  Weather({
    this.weatherIcon, 
    this.cityName,
    this.tempC,
    this.tempF,
    this.humidity,
    this.pressure
    });
  //Will convert the value recieved and transfert to C
  double get getTempC => tempC - 272.5;

  //Take vlue from json and put value at the right place
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] as String,
      tempC: json['main']['temp'] as double,
      tempF: json['main']['temp'] as double,
      pressure: json['main']['pressure'] as int,
      humidity: json['main']['humidity'] as int,
      weatherIcon: json['weather'][0]['icon'] as String,
    );
  }
  factory Weather.fromDetailJson(Map<String, dynamic> json) {
    return Weather(
      tempC: json['main']['temp'] as double,
      tempF: json['main']['temp'] as double,
      pressure: json['main']['pressure'] as int,
      humidity: json['main']['humidity'] as int,
      weatherIcon: json['weather']['main'] as String,
    );
  }

  //Will make easy to campare btw object of the same class
  @override
  List<Object> get props => [
    cityName,
  ];
}