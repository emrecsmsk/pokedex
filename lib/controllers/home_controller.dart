import 'package:get/get.dart';
import 'package:pokedex/model/pokedex_model.dart';
import 'package:pokedex/service/pokedex_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var page = 0.obs;

  Rx<PokedexModel?> pokedexModel = Rx<PokedexModel?>(null);
  PokedexService pokedexService = PokedexService();

  Future<void> fetchPokemons() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    pokedexModel.value = await pokedexService.fetchPokemons(null, page.value);
    page.value++;
    isLoading.value = false;
  }

  Future<void> fetchMorePokemons() async {
    var newItems = await pokedexService.fetchPokemons(
        pokedexModel.value?.next, page.value);
    page.value++;
    if (newItems != null) {
      pokedexModel.update((val) {
        if (val != null) {
          val.results = val.results! + newItems.results!;
          val.next = newItems.next;
        }
      });
    }
  }
}
