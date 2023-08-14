import 'package:equatable/equatable.dart';

class PokemonResponse extends Equatable {
  const PokemonResponse(
      {required this.types,
      required this.weight,
      required this.baseExperience,
      required this.height,
      required this.id,
      required this.name,
      required this.sprites});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      PokemonResponse(
          types: (json['types'] as List)
              .map((value) => PokemonTypeInfoResponse.fromJson(value))
              .toList(),
          id: json['id'],
          name: json['name'],
          baseExperience: json['base_experience'],
          weight: json['weight'],
          height: json['height'],
          sprites: SpritesResponse.fromJson(json['sprites']));

  final List<PokemonTypeInfoResponse> types;
  final int id;
  final String name;
  final int baseExperience;
  final int weight;
  final int height;
  final SpritesResponse sprites;

  @override
  List<Object?> get props =>
      [types, weight, baseExperience, height, id, name, sprites];
}

class PokemonTypeInfoResponse extends Equatable {
  const PokemonTypeInfoResponse({required this.type});

  factory PokemonTypeInfoResponse.fromJson(Map<String, dynamic> json) =>
      PokemonTypeInfoResponse(
        type: PokemonTypeResponse.fromJson(json['type']),
      );

  final PokemonTypeResponse type;

  @override
  List<Object?> get props => [type];
}

class PokemonTypeResponse extends Equatable {
  const PokemonTypeResponse({required this.name});

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) =>
      PokemonTypeResponse(
        name: json['name'],
      );

  final String name;

  @override
  List<Object?> get props => [name];
}

class SpritesResponse extends Equatable {
  const SpritesResponse({required this.frontDefault, required this.other});

  factory SpritesResponse.fromJson(Map<String, dynamic> json) =>
      SpritesResponse(
          frontDefault: json['front_default'],
          other: OtherResponse.fromJson(json['other']));

  final String frontDefault;
  final OtherResponse other;

  @override
  List<Object?> get props => [frontDefault, other];
}

class OtherResponse extends Equatable {
  const OtherResponse({required this.officialArtwork});

  factory OtherResponse.fromJson(Map<String, dynamic> json) => OtherResponse(
      officialArtwork:
          OfficialArtworkResponse.fromJson(json['official-artwork']));

  final OfficialArtworkResponse officialArtwork;

  @override
  List<Object?> get props => [officialArtwork];
}

class OfficialArtworkResponse extends Equatable {
  const OfficialArtworkResponse({required this.frontDefault});

  factory OfficialArtworkResponse.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkResponse(frontDefault: json['front_default']);

  final String frontDefault;

  @override
  List<Object?> get props => [frontDefault];
}
