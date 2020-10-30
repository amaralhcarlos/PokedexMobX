import 'package:flutter/material.dart';
import 'package:pokedex_mobx/consts/consts_api.dart';
import 'package:pokedex_mobx/models/pokeapi.dart';
import 'package:pokedex_mobx/pages/home_page/home_page.dart';
import 'package:pokedex_mobx/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';

class PokeDetailPage extends StatelessWidget {
  final int index;
  final String name;
  Color backgroundColor = ConstsApi.getColorByType(type: _pokemon.type[0]);

  const PokeDetailPage({Key key, this.index, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pokemonStore = Provider.of<PokeApiStore>(context);
    Pokemon _pokemon = _pokemonStore.getPokemon(this.index - 1);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: this.backgroundColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
            }),
      ),
      backgroundColor: this.backgroundColor,
    );
  }
}
