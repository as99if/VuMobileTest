
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:vumobile/core/models/dataModel.dart';

ApiProvider apiProvider = ApiProvider(); 

class ApiProvider{
  Client client = new Client();

  Future<DataModel> fetchList() async { 
    String url = "https://reqres.in/api/users?page=1";

      final response = await client.get(url);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        debugPrint('api call');
        return DataModel.fromJson(responseData['data']);
        
      } else {
        //return null;
        throw Exception("Failed to get");
      }
    

  }
}