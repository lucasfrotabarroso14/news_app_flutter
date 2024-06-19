import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_flutter/pages/new_detail_page.dart';

import '../cubits/favorite/favorite_cubit.dart';
import '../cubits/favorite/favorite_state.dart';
import '../models/new_model.dart';
import 'app_large_text.dart';
import 'app_text.dart';


class NewCard extends StatefulWidget {
  const NewCard({super.key, required this.article});
  final Article article;

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => NewDetailPage(
              articleImage: widget.article.urlToImage != null
                  ? Image.network(widget.article.urlToImage!, fit: BoxFit.cover)
                  : Icon(
                Icons.image, // Substitua pelo ícone que você preferir
                size: 50.0, // Tamanho do ícone
                color: Colors.grey, // Cor do ícone
              ),
              articleContent: widget.article.content,
            ),
          ),
        );
      },
      child: Container(
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // Mantém a imagem quadrada
                child: widget.article.urlToImage != null
                    ? Image.network(widget.article.urlToImage!, fit: BoxFit.cover)
                    : Icon(
                  Icons.image, // Substitua pelo ícone que você preferir
                  size: 50.0, // Tamanho do ícone
                  color: Colors.grey, // Cor do ícone
                ),
              ),
            ),
            SizedBox(width: 13),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(text: widget.article.title, size: 16),
                  AppText(text: widget.article.source.name)
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  final isFavorite = context.read<FavoriteCubit>().isFavorite(widget.article);
                  return IconButton(
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(widget.article);
                    },
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
