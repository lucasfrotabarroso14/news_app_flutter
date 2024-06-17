import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

class NewsItemCarrosel extends StatelessWidget {

  final Widget imageUrl;
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
            child:imageUrl
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 30),
              child: Container(

                  width: 340,
                  child: AppLargeText(text: description, color: Colors.white,size: 16,)),
            ),
          ),

        ],
      ),
    );
  }
}
