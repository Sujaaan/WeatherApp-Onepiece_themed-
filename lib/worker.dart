import 'package:http/http.dart';
import 'dart:convert';

class Worker{

  String location="";
  //constructor modified as per need
  Worker({required this.location}){
    location=this.location;
  }

  String humidity="";
  String airspeed="";
  String temperature="";
  String description="";
  String main="";
  String loc="";
  String icon="";

  Future<void> getdata()async{
    try{
      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5f56c7cf9de78c9b62321ab0a36c6f36"));
    Map data = jsonDecode(response.body);

    //getting temp,humidity
    Map temp_data = data['main'];
    var gettemperature = temp_data['temp']-273.15;
    Map wind = data['wind'];
    var getwindspeed = wind['speed'];
    var gethumidity = temp_data['humidity'];
    //getting description
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getmain_desc = weather_main_data['main'];
    String getdesc = weather_main_data['description'];
    String geticon = weather_main_data['icon'];

    //assigning values from the received API
    temperature=gettemperature.toStringAsFixed(2);
    airspeed=getwindspeed.toString();
    humidity=gethumidity.toString();
    description=getdesc;
    main=getmain_desc;
    loc=location;
    icon=geticon.toString();
    }

    catch(e){
      temperature="Enter City";
    airspeed="Enter City";
    humidity="Enter City";
    description="Enter City";
    main="Enter City not";
    icon="04n";
    }

  }

}