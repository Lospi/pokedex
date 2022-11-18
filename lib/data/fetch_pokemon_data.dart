import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/pokemon_data_api.dart';

import '../domain/pokemon.dart';

Future<PokemonData> fetchPokemonData(int index) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index'));

  if (response.statusCode == 200) {
    final pokemonData = PokemonAPIData.fromJson(jsonDecode(response.body));
    return pokemonData.toPokemon();
  } else {
    throw Exception('Failed to load Pokemon');
  }
}
