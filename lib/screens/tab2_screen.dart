import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             const _ListCategories(),
             Expanded(child: ListNews(noticias:newService.getArticlesByCategorySelected))

          ],
        )
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
      
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
          
                _CategoryButton(categorie: categories[index]),
                const SizedBox(height:5 ,),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
          
              ],
              
            ),
            );
        },
        ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({required this.categorie,});

  final Category categorie;

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context, listen: false);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = categorie.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(categorie.icon, color: (categorie.name == newsService.selectedCategory)? AppTheme.accentColor : Colors.black54,)
      ),
    );
  }
}