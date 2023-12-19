import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/model/pokedex_model.dart';

class PokemonLine extends StatelessWidget {
  const PokemonLine({
    super.key,
    required this.pokedexModel,
    required this.index,
  });

  final PokedexModel? pokedexModel;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          height: 200,
          width: 200,
          imageUrl: pokedexModel?.results?[index!].imageUrl ?? "",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(pokedexModel?.results?[index!].name!.toUpperCase() ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold))
      ],
    );
  }
}
