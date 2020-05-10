import 'package:bloc_project/data/models/modelWeatherDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// model import
import 'package:bloc_project/data/models/modelWeather.dart';
// apiUrl & apiId of https://openweathermap.org
String apiUrlWeather = "https://api.openweathermap.org/data/2.5/weather?q=";
String apiUrlWeatherDetails = "https://api.openweathermap.org/data/2.5/forecast?q=";
String apiId = "&appid=f134db3c43289be89de409a151e34178";
// class that will work as  repository to consulte api
class RepoWeather {
  //Function to get weather
  Future <Weather> getWeather(String city) async {
    final result = await http.Client().get(apiUrlWeather+city+apiId);
    print(apiUrlWeather+city+apiId);
    if(result.statusCode != 200){
      throw Exception();
    }
    return parsedWeatherJson(result.body);
  }
  
  // will past the value of json response to a model Weather
  Weather parsedWeatherJson(final response){
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded;
    return Weather.fromJson(jsonWeather);
  }
  
  //Function to get Weather DEtails(old code )
  Future <WeatherDetails> getWeatherDetails(String city) async {
    final result = await http.Client().get(apiUrlWeatherDetails+city+apiId);
    if(result.statusCode != 200){
      throw Exception();
    }
    return parsedWeatherDetailsJson(result.body);
  }
  // will past the value of json response to a model weather Details (old code )
  WeatherDetails parsedWeatherDetailsJson(final response){
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded;
    return WeatherDetails.fromDetailJson(jsonWeather);
  }
  //Function to get Weather DEtails (mustafa)
  //   Future <List<List<Weather>>> getWeatherDetails(String city) async {
  //   List<List<Weather>> weatherDetails = List<List<Weather>> () ;
  //   final result = await http.Client().get(apiUrlWeatherDetails+city+apiId);
  //   if(result.statusCode != 200){
  //     throw Exception();
  //   }
  //   Map<String, dynamic> jsonRes = json.decode(result.body);
  //   var firstDay = DateTime.fromMillisecondsSinceEpoch((jsonRes['list'][0]["dt"])*1000).day;
  //   var secondDay = firstDay++;
  //   var thirdDay = secondDay++;
  //   for (var i = 0; i < jsonRes['list'].length; i++) {
  //     var day = DateTime.fromMillisecondsSinceEpoch((jsonRes['list'][i]["dt"])*1000).day;
  //     if(firstDay == day ){
  //       weatherDetails[0].add( Weather.fromDetailJson(jsonRes['list'][i]));
  //     }else if(secondDay == day ){
  //       weatherDetails[1].add( Weather.fromDetailJson(jsonRes['list'][i]));
  //     }
  //     else if(thirdDay == day ){
  //       weatherDetails[2].add( Weather.fromDetailJson(jsonRes['list'][i]));
  //     }
  //     else {
  //       weatherDetails[3].add( Weather.fromDetailJson(jsonRes['list'][i]));
  //     }
  //   }
  //   print(weatherDetails);
  //   print(weatherDetails[0][0].tempC);
  //   return weatherDetails;
  // }
}

