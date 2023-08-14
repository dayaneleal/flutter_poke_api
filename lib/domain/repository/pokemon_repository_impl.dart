import 'package:dio/dio.dart';
import 'package:flutter_poke_api/data/repository/pokemon_repository.dart';
import 'package:flutter_poke_api/data/response/pokemon_list_response.dart';
import 'package:flutter_poke_api/data/response/pokemon_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this.dio);

  final Dio dio;

  @override
  Future<PokemonListResponse> getPokemonList() async {
    final response = await dio.get('');

    try {
      return PokemonListResponse.fromJson(response.data);
    } on Exception {
      throw Exception('Um erro inesperado ocorreu');
    }
  }

  @override
  Future<PokemonResponse> getPokemon(String pokemon) async {
    final response = await dio.get(pokemon);
    try {
      return PokemonResponse.fromJson(response.data);
    } on Exception {
      throw Exception('Um erro inesperado ocorreu');
    }
  }
}
