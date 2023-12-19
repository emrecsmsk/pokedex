import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({super.key, required this.pokemon});

  final String? pokemon;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PokemonController pokemonController = Get.put(PokemonController());

  @override
  void initState() {
    super.initState();

    pokemonController.fetchPokemon(widget.pokemon!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pokemon Detail",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Obx(() => pokemonController.isLoading.value
            ? Center(
                child: Lottie.asset("assets/lottie/loading.json",
                    height: 200, width: 200),
              )
            : pokemonController.isFound.value
                ? Column(children: [
                    Center(
                      child: CachedNetworkImage(
                        height: 300,
                        width: 300,
                        imageUrl:
                            pokemonController.pokemonModel?.imageUrl ?? "",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          pokemonController.pokemonModel?.name!.toUpperCase() ??
                              "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ABILITIES:    ${pokemonController.pokemonModel?.abilities?[0].ability?.name ?? ""}",
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "TYPES:    ${pokemonController.pokemonModel?.types?[0].type?.name ?? ""}",
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "HEIGHT:    ${pokemonController.pokemonModel?.height ?? ""}",
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "WEIGHT:    ${pokemonController.pokemonModel?.weight ?? ""}",
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                    )
                  ])
                : Center(
                    child: Image.asset("assets/png/notFound.png",
                        height: 200, width: 200))));
  }
}
