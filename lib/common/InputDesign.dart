import 'package:flutter/material.dart';

class InputDesign extends StatelessWidget {
  final TextEditingController controllerInput;
  InputDesign(this.controllerInput);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: Colors.blueGrey[100],
      borderOnForeground: false,
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
      child: TextFormField(
        controller: controllerInput,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
                fontFamily: "Quicksand"),
            hintText: "Search With Name of City",
            fillColor: Colors.white70),
      ),
    );
  }
}
