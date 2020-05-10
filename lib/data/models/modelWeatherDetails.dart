
import 'package:bloc_project/data/models/modelWeather.dart';

class WeatherDetails {
  //Element of Weather Class
  final List<Weather> weatherFirstDay;
  final List<Weather> weatherSecondDay;
  final List<Weather> weatherThirdDay;
  final List<Weather> weatherLastDay;

  //Constructeur
  WeatherDetails(
    this.weatherFirstDay,
    this.weatherSecondDay,
    this.weatherThirdDay,
    this.weatherLastDay);

  //Take vlue from json and put value at the right place
  factory WeatherDetails.fromDetailJson(Map<String, dynamic> json) {
    // will give u the day DateTime.fromMillisecondsSinceEpoch(1589047200*1000).day
    WeatherDetails weatherDetails ;
    var firstDay = DateTime.fromMillisecondsSinceEpoch((json['list'][0]["dt"])*1000).day;
    var secondDay = firstDay++;
    var thirdDay = secondDay++;
    for (var i = 0; i < json['list'].length; i++) {
      var day = DateTime.fromMillisecondsSinceEpoch((json['list'][i]["dt"])*1000).day;
      if(firstDay == day ){
        weatherDetails.weatherFirstDay.add( Weather.fromDetailJson(json['list'][i]));
      }else if(secondDay == day ){
        weatherDetails.weatherSecondDay.add( Weather.fromDetailJson(json['list'][i]));
      }
      else if(thirdDay == day ){
        weatherDetails.weatherThirdDay.add( Weather.fromDetailJson(json['list'][i]));
      }
      else {
        weatherDetails.weatherLastDay.add( Weather.fromDetailJson(json['list'][i]));
      }
    }
    print(weatherDetails.weatherFirstDay[0].tempC);
    return weatherDetails;
  }
}