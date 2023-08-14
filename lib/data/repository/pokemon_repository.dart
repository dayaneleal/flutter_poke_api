import 'package:flutter_poke_api/data/response/pokemon_list_response.dart';
import 'package:flutter_poke_api/data/response/pokemon_response.dart';

abstract class PokemonRepository {
  Future<PokemonListResponse> getPokemonList();

  Future<PokemonResponse> getPokemon(String pokemon); 
}
