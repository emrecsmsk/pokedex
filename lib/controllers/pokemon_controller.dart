import 'package:get/get.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/service/pokedex_service.dart';
import 'package:pokedex/utility/theme/CustomTheme.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var isFound = true.obs;

  PokemonModel? pokemonModel = PokemonModel();
  PokedexService pokedexService = PokedexService();

  Future<void> fetchPokemon(String pokemon) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    pokemonModel = await pokedexService.fetchPokemon(pokemon);
    if (pokemonModel?.id != null) {
      isFound.value = true;
      changeTheme(pokemonModel!.types![0].type!.name!);
    } else {
      isFound.value = false;
    }
    isLoading.value = false;
  }

  void changeTheme(String type) {
    if (type == "grass") {
      Get.changeTheme(CustomTheme().grassTheme);
    } else if (type == "fire") {
      Get.changeTheme(CustomTheme().fireTheme);
    } else if (type == "water") {
      Get.changeTheme(CustomTheme().waterTheme);
    } else if (type == "bug") {
      Get.changeTheme(CustomTheme().bugTheme);
    } else if (type == "normal") {
      Get.changeTheme(CustomTheme().initialTheme);
    }
  }
}
