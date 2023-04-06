import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/location_model.dart';
import 'package:http/http.dart' as http;

String baseUrl =
    "https://mvvvip1.defas-fgi.de/mvv/XML_STOPFINDER_REQUEST?language=de&outputFormat=RapidJSON&type_sf=any&name_sf=";

//here I have a public list with name "list" to save data as a list in that
List<Location>? list;

class myService {
  var client = http.Client();
  //I used http packages for getting data from url and with Future<dynamic> I send a request to server
  Future<dynamic> get(String api) async {
    //get the baseUrl with "api" for fill the correct request and also for search location user want at the end of url
    //parse the url to uri and use "get" method to send a get request to server
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    // check the response statusCode and decode all data and parse data from jsonArray "locations" as a list
    if (response.statusCode == 200) {
      var body = response.body;
      var data = json.decode(body);
      var rest = data['locations'] as List;
      // convert them to map and fill the list with "fromJson" method I have in location_model
      list = rest.map<Location>((json) => Location.fromJson(json)).toList();

      //return a list if the statusCode is 200 for the else methode we can use handle exception or error but I just return and close it
      //it's about policies of backend
      return list;
    } else {
      return;
    }
  }
}
