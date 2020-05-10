import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/models/modelWeather.dart';
import 'package:bloc_project/data/models/modelWeatherDetails.dart';
import 'package:bloc_project/data/repositories/repoWeather.dart';
import 'package:equatable/equatable.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  final RepoWeather repoWeather;

  WeatherblocBloc(this.repoWeather);

  @override
  WeatherblocState get initialState => WeatherInitial();

  @override
  Stream<WeatherblocState> mapEventToState(
    WeatherblocEvent event,
  ) async* {
    yield WeatherLoading();
    // get weather 
    if (event is GetWeather) {
      print(event.cityName);
      try {
        final weather = await repoWeather.getWeather(event.cityName);
        print(weather);
        yield WeatherLoaded(weather);
      } catch(err){
        yield WeatherError("Couldn't fetch "+event.cityName+" weather. Is the device online?\n");
      }
    }
    //get weather details
    else if (event is GetWeatherDetail) {
      try {
        final weatherDetails = await repoWeather.getWeatherDetails(event.cityName);
        yield WeatherDetailsLoaded(weatherDetails);
      } catch (err) {
        yield WeatherError("Couldn't fetch "+event.cityName+"weather. Is the device online? \n");
      }
      
    }
    else if (event is ResoteWeather){
      yield WeatherInitial();
    }
  }
}
