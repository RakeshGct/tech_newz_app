import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_newz/pages/home.dart';
import 'package:tech_newz/utils/key.dart';
import 'package:tech_newz/components/searchbar.dart';

Future<List> fetchnews() async {
  final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
          ApiKey.key + '&q=' + Home.searchController.text),
          );
  Map result = jsonDecode(response.body);
  print("Fetched");

  return (result['articles']);
}