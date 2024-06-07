import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

class NewsItemCarrosel extends StatelessWidget {
  const NewsItemCarrosel({super.key});

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

              "https://s.yimg.com/ny/api/res/1.2/m8pYpe_L6lFKLGe2AeEHaA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02MDA-/https://media.zenfs.com/en/the_wall_street_journal_hosted_996/c6648e7d6b48ffdebde02401bd5aac19",
              fit: BoxFit.cover,
                width: double.infinity, // Largura do Container
                height: double.infinity// Ajuste a imagem para cobrir o ClipRRect
            ),
          ),
          AppText(text: "Teste noticia", color: Colors.white),
        ],
      ),
    );
  }
}
