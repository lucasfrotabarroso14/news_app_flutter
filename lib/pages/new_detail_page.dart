import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

class NewDetailPage extends StatefulWidget {
  const NewDetailPage({super.key, required this.articleImage, required this.articleContent});
  final Widget articleImage;
  final String articleContent;

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

              child: widget.articleImage,
            ),
            Positioned(child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
            )),


          ],



            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: AppLargeText(text:widget.articleContent,size: 27,)
              ),
            )
            )]

          )

      );

  }
}
