import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  // TextEditingController to connect with text-fields
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";
  final double opacity = 10;

  void calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || inches > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        // our BMI
        result = weight / (inches * inches) * 703;
        //do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight!"; //Underweight
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great Shape!"; //normal
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading = "Overweight!"; //Overweight
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) > 30.0) {
          _resultReading = "Obese!"; //Obese
          print(_resultReading);
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(96, 125, 139, opacity),
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            //image logo
            new Image.asset(
              'images/bmi.png',
              height: 125.0,
              width: 150.0,
            ),
            //container for text-fields
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 255.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  //text fields
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: 'e.g: 34',
                        icon: new Icon(Icons.person_outline)),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in feet",
                        hintText: 'e.g: 6.5',
                        icon: new Icon(Icons.insert_chart)),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lbs",
                        hintText: 'e.g: 180',
                        icon: new Icon(Icons.line_weight)),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.6)),

                  //calculate button
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: calculateBMI,
                      color: Colors.lightBlueAccent,
                      child: new Text("Calculate"),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            //output text
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_finalResult",
                  style: new TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
