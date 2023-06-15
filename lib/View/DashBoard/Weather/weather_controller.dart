// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:todo_app/Model/weather_model.dart';
//
// class WeatherController extends ChangeNotifier{
//   Future GetWeather()async{
//     List<WeatherModel> weatherModel = [];
//     var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=d04e81d93f548846016f6700799fa99e'));
//     if(response.statusCode == 200){
//       var result = jsonDecode(response.body.toString());
//       for(var data in result){
//         WeatherModel model = WeatherModel.fromJson(data);
//       }
//     }
//     return WeatherModel;
//   }
// }
