import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/new_model.dart';

class NewsService{
  final String _baseUrl = "https://newsapi.org/v2/top-headlines";
  final String _apiKey = "fd239ece050a4ed8aa8b2679eaea9284";

  Future<List<Article>> getTopHeadLines() async {
    String url = "$_baseUrl?country=br&apiKey=$_apiKey";
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);

        List<Article> articles = (jsonData["articles"] as List)
        .map((articlesJson) => Article.fromJson(articlesJson))
        .toList();
        return articles;
      } else{
        throw Exception('Failed to load top headlines: ${response.statusCode}');
      }
    }catch(e){
      throw Exception("Failed to load top headlines : $e");
    }
  }

}