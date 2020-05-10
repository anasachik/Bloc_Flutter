part of 'weatherbloc_bloc.dart';

abstract class WeatherblocState extends Equatable {
  const WeatherblocState();
}

class WeatherInitial extends WeatherblocState {
  const WeatherInitial();
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherblocState {
  const WeatherLoading();
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherblocState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  Weather get getWeather => weather;
  @override
  List<Object> get props => [weather];
}
class WeatherDetailsLoaded extends WeatherblocState {
  final WeatherDetails weatherDetails;
  const WeatherDetailsLoaded(this.weatherDetails);
  @override
  List<Object> get props => [weatherDetails];
}

class WeatherError extends WeatherblocState {
  final String message;
  const WeatherError(this.message);
  @override
  List<Object> get props => [message];
}