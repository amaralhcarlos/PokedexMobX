import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_mobx/consts/consts_app.dart';
import 'package:pokedex_mobx/models/pokeapi.dart';
import 'package:pokedex_mobx/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex_mobx/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex_mobx/stores/pokeapi_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeApiStore pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBarWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
              top: -(240 / 3.7),
              left: screenWidth - (240 / 1.6),
              child: Opacity(
                child: Image.asset(
                  ConstsApp.blackPokeball,
                  height: 240,
                  width: 240,
                ),
                opacity: 0.1,
              )),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusBarWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                        name: 'HomePageList',
                        builder: (BuildContext context) {
                          PokeApi _pokeApi = pokeApiStore.pokeApi;
                          return (_pokeApi != null)
                              ? AnimationLimiter(
                                  child: GridView.builder(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.all(12),
                                      addAutomaticKeepAlives: true,
                                      gridDelegate:
                                          new SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemCount: _pokeApi.pokemon.length,
                                      itemBuilder: (context, index) {
                                        Pokemon pokemon =
                                            pokeApiStore.getPokemon(index);
                                        return AnimationConfiguration
                                            .staggeredGrid(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 375),
                                          columnCount: 2,
                                          child: ScaleAnimation(
                                            child: GestureDetector(
                                              child: PokeItem(
                                                index: index,
                                                nome: pokemon.name,
                                                num: pokemon.num,
                                                types: pokemon.type,
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Container(),
                                                      fullscreenDialog: true,
                                                    ));
                                              },
                                            ),
                                          ),
                                        );
                                      }))
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
