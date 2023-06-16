import 'package:flutter/material.dart';
import 'package:todo_app/Model/weather_model.dart';
import 'package:todo_app/View/DashBoard/Weather/weather_controller.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel model = WeatherModel();
  WeatherController weatherController = WeatherController();
  final cityController = TextEditingController();
  // void getweather()async{
  //   model = await weatherController.GetWeather('Peshawar');
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Select Your City',
                border: const OutlineInputBorder(),
                suffixIcon: InkWell(
                  onTap: ()async{
                    model = await weatherController.GetWeather(context,cityController.text);
                    print(model.name);
                    setState(() {
                    });
                    cityController.clear();
                  },
                  child: Icon(Icons.send),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${model.coord?.lat?.toInt()} °C',style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.normal,color: Colors.white),),
                    Text('${model.weather?[0].description}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.white),),
                    SizedBox(
                      height: 20,
                    ),
                    Text('City  ${model.name}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('Country  ${model.sys?.country}',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


