import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/screens/pokemon_detail.dart';
import 'package:pokedex/widgets/pokemon_line.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    homeController.fetchPokemons();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        homeController.fetchMorePokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pokedex",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Obx(() => homeController.isLoading.value
            ? Center(
                child: Lottie.asset("assets/lottie/loading.json",
                    height: 200, width: 200))
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onSubmitted: (value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                    pokemon: textEditingController.text)));
                      },
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PokemonDetail(
                                          pokemon:
                                              textEditingController.text)));
                            },
                            icon: Icon(Icons.search)),
                        labelText: "Search Pokemon",
                      ),
                      controller: textEditingController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: homeController
                                .pokedexModel.value?.results?.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PokemonDetail(
                                              pokemon: homeController
                                                  .pokedexModel
                                                  .value
                                                  ?.results?[index]
                                                  .name,
                                            )));
                              },
                              child: PokemonLine(
                                  pokedexModel:
                                      homeController.pokedexModel.value,
                                  index: index));
                        }),
                  ),
                ],
              )));
  }
}
