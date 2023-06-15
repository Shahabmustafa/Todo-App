import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/weather_model.dart';
import 'package:todo_app/View/DashBoard/Weather/weather_controller.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final cityController = TextEditingController();
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  List<WeatherModel> weatherModel = [];
  Future GetWeather()async{
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${cityController.text}&appid=d04e81d93f548846016f6700799fa99e'));
    if(response.statusCode == 200){
      var result = jsonDecode(response.body.toString());
      setState(() {
        this.temp = result['main']['temp'];
        this.description = result['weather'][0]['description'];
        this.currently = result['weather'][0]['main'];
        this.humidity = result['main']['humidity'];
        this.windSpeed = result['wind']['speed'];
      });
    }
    // return weatherModel;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetWeather();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: cityController,
            decoration: InputDecoration(),
          ),
          ElevatedButton(
              onPressed: (){
                print("${cityController.text}");
              },
              child: Text('Click')
          ),
          Text(description != null ? description.toString() : 'Null'),
        ],
      )
    );
  }
}
