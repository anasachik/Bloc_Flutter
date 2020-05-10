part of 'weatherbloc_bloc.dart';

abstract class WeatherblocEvent extends Equatable {
  const WeatherblocEvent();
}

class GetWeather extends WeatherblocEvent{
  final String cityName;
  const GetWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
  
}

class GetWeatherDetail extends WeatherblocEvent{
  final String cityName;
  GetWeatherDetail(this.cityName);

  @override
  List<Object> get props => [cityName];
  
}
class ResoteWeather extends WeatherblocEvent{
  @override
  List<Object> get props => null;
  
}