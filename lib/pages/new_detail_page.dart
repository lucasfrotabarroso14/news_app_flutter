import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

class NewDetailPage extends StatefulWidget {
  const NewDetailPage({super.key});

  @override
  State<NewDetailPage> createState() => _NewDetailPageState();
}

class _NewDetailPageState extends State<NewDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children:[
          Stack(
          children: [
            Container(
              height: 300,

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://s.yimg.com/ny/api/res/1.2/m8pYpe_L6lFKLGe2AeEHaA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02MDA-/https://media.zenfs.com/en/the_wall_street_journal_hosted_996/c6648e7d6b48ffdebde02401bd5aac19"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Positioned(child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
            )),
            Positioned(
              bottom: 20,
                child:Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                      width:340,
                      child: AppLargeText(text: "fdjdsijgldgklfsgfdsgnkldngk.ndkjgnkjdgnk.dngkjdhsnkjvhdkjhvdo;hv;;gl;",size: 20,color: Colors.white,)),
                )
            )

          ],



            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: AppText(text: "sfjsoifjoisfjo;ishjfioshofghfhioshgfoxvdvgdvgdgvdvbgdbgvdxdsbdbdbdbbdbssh",color: Colors.black,size: 20,),
                  )
              ),
            )
          ]

          )

      );

  }
}
