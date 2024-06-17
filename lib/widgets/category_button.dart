import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.category, required this.updateCategory});
  final String category;
  final VoidCallback updateCategory;

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: TextButton.styleFrom(
          backgroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.black,width: 1)
          )
      ),
      onPressed: updateCategory,
      child: Text(category),


    );
  }
}
