import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = "https:...com"; // replace with your API base URL.

  // helper method to make a GET request
  static Future<Map<String, dynamic>> get(String enddpoint) async{
    final response = await http.get(Uri.parse('$_baseUrl/$enddpoint'));
    return _handleResponse(response);
  }

  // helper method to make a POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async{
    final response = await http.post(
    Uri.parse('$_baseUrl/$endpoint'),
    headers: {'context-type': 'application/json'},
    body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async{
    final response = await http.put(
    Uri.parse('$_baseUrl/$endpoint'),
    headers: {'Context-Type': 'application/json'},
    body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // handle the http response
  static Map<String, dynamic> _handleResponse(http.Response response){
    if(response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception('failed to load data : ${response.statusCode}');
    }
  }
}