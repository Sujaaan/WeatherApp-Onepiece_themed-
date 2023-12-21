import 'package:flutter/material.dart';
import 'package:weather_app/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String hum="";
  String air_speed="";
  String temp="";
  String desc="";
  String main="";
  String location="";
  String icon="";
  String city="";

  void Startapp(String place)async{
    Worker instance = Worker(location: place);
    await instance.getdata();
    hum=instance.humidity;
    temp=instance.temperature;
    desc=instance.description;
    main=instance.main;
    air_speed=instance.airspeed;
    location=instance.loc;
    icon=instance.icon;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
      "temp_val" : "$temp",
      "hum_val" : hum,
      "desc_val" : desc,
      "air_speed_val" : air_speed,
      "main_val" : main,
      "icon_val" : icon,
      "city_value" : place,
    });
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    
    Map? city_info = ModalRoute.of(context)?.settings.arguments as Map?;
    if(city_info?.isNotEmpty ?? false){
      city=city_info?['city_val'];
    }
    Startapp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/nami.jpg'),fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children:<Widget> [
                SizedBox(height: 30,),
                Image.asset('images/disaster.png',height: 200,width: 200,),
                SizedBox(height: 340,),
                Text("Weatheria",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(height: 10,),
                SpinKitSpinningLines(
                  size: 80,
                  color: Colors.blue,
                  lineWidth: 7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}