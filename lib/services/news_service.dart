import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier{

  List<Article> headlines =[];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vial, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyball, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};
  
  final String _baseUrl = "newsapi.org";
  final String _country = "us";
  final String _apikey = '39986bc7d41343a6a8676d855af963bc';

  NewsService(){

    getTopHeadLines();

    for (var element in categories) {
      categoryArticles[element.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor){
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticlesByCategorySelected => categoryArticles[selectedCategory]!;


  getTopHeadLines() async{

    final url = Uri.https(_baseUrl,'/v2/top-headlines',{
      'country': _country,
      'apiKey': _apikey

    });
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    headlines = newsResponse.articles;
    notifyListeners();
  }

  getArticlesByCategory(String category) async {

    if(categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final url = Uri.https(_baseUrl,'/v2/top-headlines',{
      'country': _country,
      'apiKey': _apikey,
      'category': category

    });
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);
    categoryArticles[category] = newsResponse.articles ;
    
    notifyListeners();

  }
}