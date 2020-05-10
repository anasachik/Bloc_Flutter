import 'package:bloc_project/data/models/modelWeather.dart';
import 'package:flutter/material.dart';

class WeatherUi extends StatelessWidget {
  final Weather weather;
  final Function() restore;
  const WeatherUi(this.weather, this.restore);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                offset: new Offset(0.0, 0.0),
                blurRadius: 30.0,
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: restore,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.close,
                        size: 25,
                        color: Colors.redAccent,
                      ),
                    )),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, bottom: 12.0),
                    child: Material(
                      elevation: 15.0,
                      shadowColor: Colors.black87,
                      borderOnForeground: false,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50.0),
                      ),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black12,
                                offset: new Offset(0.0, 0.0),
                                blurRadius: 30.0,
                              )
                            ],
                          ),
                          height: 150,
                          width: 150,
                          child: Image.network(
                              "http://openweathermap.org/img/wn/" +
                                  weather.weatherIcon +
                                  ".png"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            weather.cityName,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w800,
                                // Quicksand is a font specified into assets/fonts
                                fontFamily: "Quicksand"),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "TempC:",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              weather.getTempC.round().toString()+" C",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "TempF:",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              weather.tempF.toString()+" F",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Pressure:",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              weather.pressure.toString()+" %",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "humidity:",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              weather.humidity.toString()+" %",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  // Quicksand is a font specified into assets/fonts
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
