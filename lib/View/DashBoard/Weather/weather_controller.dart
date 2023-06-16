import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/Model/weather_model.dart';
import 'package:todo_app/Utils/flutter_toast.dart';

class WeatherController{
  List<WeatherModel> weatherModel = [];

  Future GetWeather(BuildContext context,String place)async{
   try{
     var key = 'd04e81d93f548846016f6700799fa99e';
     var q = place;
     var uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$place&appid=$key');
     final response = await http.get(uri);
     if(response.statusCode == 200){
       return WeatherModel.fromJson(jsonDecode(response.body));
     }else{
       throw Exception("City Not Found");
     }
   }catch(e){
     print(e.toString());
   }
  }
}
