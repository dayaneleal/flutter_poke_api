import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_poke_api/data/repository/pokemon_repository.dart';
import 'package:flutter_poke_api/data/response/pokemon_response.dart';
import 'package:flutter_poke_api/utils/utils.dart';
import 'package:get_it/get_it.dart';

part 'pokedex_page_state.dart';

class PokedexPageCubit extends Cubit<PokedexPageState> {
  PokedexPageCubit() : super(PokedexPageInitial()) {
    _getPokemonList();
  }

  final PokemonRepository repository = GetIt.I.get<PokemonRepository>();
  List<PokemonResponse> pokemonList = [];

   void _getPokemonList() async {
    emit(PokedexPageLoading());
    try {
      await repository.getPokemonList().then((value) async {
        for (var e in value.results) {
          await _getPokemonById(e.url.extractNumber)
              .then((value) => pokemonList.add(value));
        }
      });
      emit(PokedexPageSuccess(pokemonList));
    } catch (e) {
      emit(PokedexPageError());
    }
  }

  Future<PokemonResponse> _getPokemonById(String id) {
    return repository.getPokemon(id);
  }
}
