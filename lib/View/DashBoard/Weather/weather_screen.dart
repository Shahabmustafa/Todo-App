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
    final heigth = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.white
              ]
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'Select Your City',
                      border: const OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: InkWell(
                        onTap: ()async{
                          model = await weatherController.GetWeather(context,cityController.text);
                          print(model.name);
                          setState(() {
                          });
                          cityController.clear();
                        },
                        child: Icon(Icons.send,color: Colors.white,),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: heigth * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${model.main?.temp?.toInt()} °F',style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.normal,color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heigth * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Wearher',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              model.weather?[0].description == "clear sky" ?
                              Image.asset('images/sun.png',height: 40,width: 40,) :
                              model.weather?[0].description == "haze" ?
                              Image.asset('images/fog.png',height: 40,width: 40,) :
                              model.weather?[0].description == 'few cloude' ?
                              Image.asset('images/sun.png',height: 40,width: 40,) :
                              model.weather?[0].description == 'rain' ?
                              Image.asset('images/rain.png',height: 40,width: 40,) :
                              Image.asset('images/cloudy.png',height: 40,width: 40,),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${model.weather?[0].description}',
                                style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Place',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/placeholder.png',height: 25,width: 25,),
                              SizedBox(
                                width: 5,
                              ),
                              Text('${model.name}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            ],
                          ),
                          Text('${model.sys?.country}',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black),)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heigth * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Humidity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('images/humidity.png',height: 40,width: 40,),
                              Text('${model.main?.humidity}%',style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Wind',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('images/wind.png',height: 40,width: 40,),
                              Text('${model.wind?.speed}%',style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


