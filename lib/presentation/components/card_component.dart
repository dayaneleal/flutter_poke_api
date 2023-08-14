import 'package:flutter/material.dart';
import 'package:flutter_poke_api/data/response/pokemon_response.dart';
import 'package:flutter_poke_api/presentation/widgets/progress_indicator_widget.dart';
import 'package:flutter_poke_api/utils/utils.dart';
import 'package:intl/intl.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.pokemon});

  final PokemonResponse pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green[400]),
            child: Hero(
              tag: pokemon.id,
              child: Image.network(
                  pokemon.sprites.other.officialArtwork.frontDefault,
                  loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : const ProgressIndicatorWidget()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nº${pokemon.id.formatNumber}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                Text(
                  toBeginningOfSentenceCase(pokemon.name) ?? '',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                    'Type: ${toBeginningOfSentenceCase(pokemon.types[0].type.name)}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
