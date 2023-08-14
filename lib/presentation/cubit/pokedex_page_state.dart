part of 'pokedex_page_cubit.dart';

abstract class PokedexPageState extends Equatable {
  const PokedexPageState();

  @override
  List<Object> get props => [];
}

class PokedexPageInitial extends PokedexPageState {}

class PokedexPageLoading extends PokedexPageState {}

class PokedexPageSuccess extends PokedexPageState {
  const PokedexPageSuccess(this.pokemonList);

  final List<PokemonResponse> pokemonList;

  @override
  List<Object> get props => [pokemonList];
}

class PokedexPageError extends PokedexPageState {}
