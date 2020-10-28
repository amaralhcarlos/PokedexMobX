import 'package:flutter/material.dart';

class ConstsApi {
  static String pokeApiUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-pokedex/master/pokedex.json';

  static Color getColorByType({String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[200];
        break;
      case 'Fighting':
        return Colors.orange;
        break;
      case 'Flying':
        return Colors.blueAccent;
        break;
      case 'Poison':
        return Colors.purple;
        break;
      case 'Ground':
        return Colors.brown[600];
        break;
      case 'Rock':
        return Colors.grey;
        break;
      case 'Bug':
        return Colors.lightGreen;
        break;
      case 'Ghost':
        return Colors.indigo[400];
        break;
      case 'Steel':
        return Colors.blueGrey;
        break;
      case 'Fire':
        return Colors.red;
        break;
      case 'Water':
        return Colors.blue;
        break;
      case 'Grass':
        return Colors.green;
        break;
      case 'Electric':
        return Colors.amber;
        break;
      case 'Psychic':
        return Colors.pink;
        break;
      case 'Ice':
        return Colors.cyanAccent[400];
        break;
      case 'Dragon':
        return Colors.indigo[800];
        break;
      case 'Fairy':
        return Colors.pinkAccent;
        break;
      case 'Dark':
        return Colors.black54;
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
