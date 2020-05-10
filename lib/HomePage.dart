import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/bloc/weatherbloc_bloc.dart';
import 'package:bloc_project/common/InputDesign.dart';
import 'package:bloc_project/common/SubmitButton.dart';
import 'package:flutter/material.dart';

import 'common/WeatherUi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _cityName = TextEditingController();
    final weatherBloc = BlocProvider.of<WeatherblocBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "First App that use Bloc",
          style: TextStyle(
            fontFamily: "Quicksand",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomePageStatic(
              title: "Weather Meteo",
            ),
            // BlocListener<WeatherblocBloc, WeatherblocState>(
            //   listener: (context, state) {
            //     if (state is WeatherError) {
            //       Scaffold.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(state.message),
            //         ),
            //       );
            //     }
            //   },
            // ),
            BlocBuilder<WeatherblocBloc, WeatherblocState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InputDesign(_cityName),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SubmitButton(() {
                          weatherBloc.add(GetWeather(_cityName.text));
                        }, "Submit"),
                      )
                    ],
                  );
                } else if (state is WeatherLoading) {
                  return Center(
                    child: CircularLoder(),
                  );
                } else if (state is WeatherLoaded) {
                  return WeatherUi(state.weather, () {
                    weatherBloc.add(ResoteWeather());
                  });
                } else if (state is WeatherError) {
                  return Err(state.message, () {
                    weatherBloc.add(ResoteWeather());
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageStatic extends StatefulWidget {
  final String title;
  const HomePageStatic({Key key, this.title}) : super(key: key);

  @override
  _HomePageStaticState createState() => _HomePageStaticState();
}

class _HomePageStaticState extends State<HomePageStatic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/love-and-romance.png',
              height: 300.0,
              width: 300.0,
            ),
          ),
        ),
        Text(widget.title)
      ],
    );
  }
}

class CircularLoder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text("LOADING DATA, PLEASE WAIT"),
          )
        ],
      ),
    );
  }
}

class Err extends StatelessWidget {
  final String message;
  final Function restore;
  Err(this.message, this.restore);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: GestureDetector(
            onTap: restore,
            child: Icon(
              Icons.restore,
              size: 40,
              color: Colors.redAccent,
            ),
          ),
        ),
        Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: Colors.redAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
