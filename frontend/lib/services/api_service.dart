import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> sendPost(String url, String json_body) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json_body,
  );
  return response;
}

Future<SplitUser> createUser(
  String user_id,
  String display_name,
  String email,
) async {
  String jsonBody = jsonEncode(<String, String>{
    'user_id': user_id,
    'display_name': display_name,
    'email': email,
  });
  final response =
      await sendPost('https://jsonplaceholder.typicode.com/albums', jsonBody);

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return SplitUser.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class SplitUser {
  final String user_id;
  final String display_name;
  final String email;

  const SplitUser(
      {required this.user_id, required this.display_name, required this.email});

  factory SplitUser.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'user_id': String user_id,
        'display_name': String display_name,
        'email': String email,
      } =>
        SplitUser(
          user_id: user_id,
          display_name: display_name,
          email: email,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
