import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/theme/app_theme.dart';

class ListNews extends StatelessWidget {
  const ListNews({super.key, required this.noticias});

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return _New(noticia: noticias[index], index: index);
      },
      );
  }
}

class _New extends StatelessWidget {
  const _New({required this.noticia, required this.index});

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TargetTopBar(noticia: noticia, index: index,),
        _TargetTitle(noticia:noticia),
        _TargetImage(noticia:noticia),
        _TargetBody(noticia:noticia),
        const _TargetButtons(),

        const SizedBox(height: 10,),
        const Divider(),
      ],
    );
  }
}

class _TargetTopBar extends StatelessWidget {
  const _TargetTopBar({ required this.noticia, required this.index,});
  
  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: const TextStyle(color: AppTheme.accentColor, fontSize: 18),),
          Text('${noticia.source.name}.',style: const TextStyle( fontSize: 18)),
        ],
      ),
    );
  }
}

class _TargetTitle extends StatelessWidget {
  const _TargetTitle({required this.noticia});

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TargetImage extends StatelessWidget {
  const _TargetImage({required this.noticia});

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: (noticia.urlToImage != null)
          ? 
           FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(noticia.urlToImage)
            )
          : 
          const Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}

class _TargetBody extends StatelessWidget {
  const _TargetBody({required this.noticia});

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text((noticia.description != null) ? noticia.description : ' ', style: const TextStyle(fontSize: 16,),),
    );
  }
}

class _TargetButtons extends StatelessWidget {
  const _TargetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            fillColor: AppTheme.accentColor,
            onPressed: () {  } ,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
            ),
          
          const SizedBox(width: 10,),
          
          RawMaterialButton(
            fillColor: AppTheme.primary,
            onPressed: () {  } ,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
            ),
        ],
      ),
    );
  }
}