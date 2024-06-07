import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

class NewCard extends StatelessWidget {
  const NewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // Mantém a imagem quadrada
              child: Image.network(
                "https://s.yimg.com/ny/api/res/1.2/m8pYpe_L6lFKLGe2AeEHaA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02MDA-/https://media.zenfs.com/en/the_wall_street_journal_hosted_996/c6648e7d6b48ffdebde02401bd5aac19",
                fit: BoxFit.cover, // Garante que a imagem cubra todo o espaço do container
              ),
            ),
          ),
          SizedBox(width: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLargeText(text: "Noticia bla bla",size: 16,),
              AppText(text: "sjf,lsjnflknsflknslkfnlkfsnflknfls")
            ],
          ),

        ],
      ),
      
    );
  }
}
