import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

class NewsItemCarrosel extends StatelessWidget {

  final String imageUrl;
  final String description;

  const NewsItemCarrosel({super.key, required this.imageUrl, required this.description});


  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.green
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.network(

              imageUrl,
              fit: BoxFit.cover,
                width: double.infinity, // Largura do Container
                height: double.infinity// Ajuste a imagem para cobrir o ClipRRect
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(text: description, color: Colors.white),
          ),

        ],
      ),
    );
  }
}
