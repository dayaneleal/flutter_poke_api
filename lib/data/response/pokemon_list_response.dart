import 'package:equatable/equatable.dart';

class PokemonListResponse extends Equatable {
  const PokemonListResponse({required this.results});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      PokemonListResponse(
        results: (json['results'] as List<dynamic>)
            .map((pokemonResultJson) =>
                ResultResponse.fromJson(pokemonResultJson))
            .toList(),
      );

  final List<ResultResponse> results;

  @override
  List<Object?> get props => [results];
}

class ResultResponse extends Equatable {
  const ResultResponse({required this.name, required this.url});

  factory ResultResponse.fromJson(Map<String, dynamic> json) => ResultResponse(
        name: json['name'],
        url: json['url'],
      );

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
