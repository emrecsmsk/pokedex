import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokedex_model.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexService {
  String baseUrl = "https://pokeapi.co/api/v2/pokemon/";
  String baseImageUrl =
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/";

  Future<PokedexModel?> fetchPokemons(String? nextUrl, int page) async {
    var url = Uri.parse(nextUrl ?? '${baseUrl}?offset=0&limit=20');
    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      var jsonMap = json.decode(response.body);
      var pokedexModel = PokedexModel.fromJson(jsonMap);

      for (var i = 0; i < pokedexModel.results!.length; i++) {
        pokedexModel.results![i].imageUrl =
            baseImageUrl + "${page * 20 + i + 1}.png";
      }

      return pokedexModel;
    } else {
      return null;
    }
  }

  Future<PokemonModel?> fetchPokemon(String pokemon) async {
    var url = Uri.parse(baseUrl + pokemon);
    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      var jsonMap = json.decode(response.body);
      var pokemonModel = PokemonModel.fromJson(jsonMap);

      pokemonModel.imageUrl = baseImageUrl + "${pokemonModel.id}.png";

      return pokemonModel;
    } else {
      return null;
    }
  }
}
