import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/domain/data/poke_api_provider.dart';
import 'package:pokedex/utilities/json_decode_helper.dart';

import '../domain/pokemon.dart';
import 'pokemon_API.dart';
import 'pokemon_data_api.dart';

class PokemonAPIProviderImpl implements PokeAPIProvider {
  static const int paginationAmount = 36;

  @override
  Future<int?> getTotalPokemonCount() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

    if (response.statusCode == 200) {
      final responseDecode =
          await JsonDecoderHelper.instance.compute(response.body);
      final pokemonAPI = PokeAPI.fromJson(responseDecode);
      return pokemonAPI.count;
    } else {
      throw Exception('Failed to load API');
    }
  }

  Future<List<String>> _fetchResultsFromCurrentPage(int currentPage) async {
    final response = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=$paginationAmount&offset=$currentPage'));

    if (response.statusCode == 200) {
      final responseDecode =
          await JsonDecoderHelper.instance.compute(response.body);
      final result = PokeAPI.fromJson(responseDecode);
      final pokemonURLList = <String>[];
      for (final pokemon in result.results!) {
        pokemonURLList.add(pokemon.url!);
      }
      return pokemonURLList;
    }
    throw Exception();
  }

  @override
  Future<List<PokemonData>> fetchPokemonPage(int page) async {
    final List<PokemonData> responsePokemonData = [];
    final List<Future> requestsList = [];
    final currentPagination = (page - 1) * paginationAmount;

    void mapResponse(dynamic response) {
      if (response.statusCode == 200) {
        final pokemonData = PokemonAPIData.fromJson(jsonDecode(response.body));
        responsePokemonData.add(pokemonData.toPokemon());
      } else {
        throw Exception('Failed to load Pokemon');
      }
    }

    final pokemonURLs = await _fetchResultsFromCurrentPage(currentPagination);

    for (int i = 0; i < pokemonURLs.length; i++) {
      final response = http.get(Uri.parse(pokemonURLs[i])).then(mapResponse);
      requestsList.add(response);
    }

    await Future.wait(requestsList);

    responsePokemonData.sort((a, b) => a.id.compareTo(b.id));

    return responsePokemonData;
  }
}
