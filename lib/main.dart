import 'package:flutter/material.dart';

import 'ui/dashboard.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const String apiUrl = 'http://10.0.2.2:8000/api/recipe';
  const String apiToken = 'as';

  generateToken();

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $apiToken',
    },
  );

  print(response.statusCode);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    // Process and use the address data in your Flutter app.
  } else {
    // Handle error or network issues.
  }
  runApp(const MyApp());
}

Future<String> generateToken() async {
  final apiUrl = Uri.parse('http://10.0.2.2:8000/generate-token');
  final response = await http.post(apiUrl);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final token = jsonResponse['token'];
    return token;
  } else {
    throw Exception('Failed to generate token');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> getAddressData() async {}

  void initState() {
    getAddressData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}
