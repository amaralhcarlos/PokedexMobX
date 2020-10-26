import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_mobx/consts/consts_api.dart';
import 'package:pokedex_mobx/models/pokeapi.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeApi;

  @computed
  PokeApi get pokeApi => _pokeApi;

  @action
  fetchPokemonList() {
    //_pokeApi = null;
    loadPokeApi().then((pokeList) {
      _pokeApi = pokeList;
    });
  }

  @action
  getPokemon(int index) {
    return _pokeApi.pokemon[index];
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(color: Colors.transparent),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokeApi> loadPokeApi() async {
    try {
      final response = await http.get(ConstsApi.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print('Erro ao carregar a lista. ' +
          error.toString() +
          '. ' +
          stacktrace.toString());
      return null;
    }
  }
}
