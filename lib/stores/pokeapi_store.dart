import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex_mobx/consts/consts_api.dart';
import 'package:pokedex_mobx/models/pokeapi.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi pokeAPI;

  @action
  fetchPokemonList() {
    loadPokeApi().then((pokeList) {
      pokeAPI = pokeList;
    });
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
