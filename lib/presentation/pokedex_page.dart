import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_api/presentation/components/card_component.dart';
import 'package:flutter_poke_api/presentation/cubit/pokedex_page_cubit.dart';
import 'package:flutter_poke_api/presentation/pokemon_detail_page.dart';
import 'package:flutter_poke_api/presentation/widgets/progress_indicator_widget.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              placeholder: 'Procurar Pokémon...',
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.black12, width: 1.0)),
            ),
            const SizedBox(height: 8),
            BlocBuilder<PokedexPageCubit, PokedexPageState>(
                builder: (context, state) {
              if (state is PokedexPageLoading) {
                return const Expanded(child: ProgressIndicatorWidget());
              } else if (state is PokedexPageSuccess) {
                return Flexible(
                  child: ListView.builder(
                      itemCount: state.pokemonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 150,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PokemonDetailPage(
                                            pokemon: state.pokemonList[index],
                                          ),
                                      fullscreenDialog: true));
                            },
                            child: CardComponent(
                                pokemon: state.pokemonList[index]),
                          ),
                        );
                      }),
                );
              } else if (state is PokedexPageError) {
                return const Text('Aconteceu um erro inesperado!');
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
