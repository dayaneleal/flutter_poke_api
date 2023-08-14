import 'package:flutter/material.dart';
import 'package:flutter_poke_api/data/response/pokemon_response.dart';
import 'package:flutter_poke_api/utils/utils.dart';
import 'package:intl/intl.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final PokemonResponse pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: [
        Stack(children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(color: Colors.lightGreen),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 32),
            alignment: Alignment.center,
            child: SizedBox(
              height: 250,
              child: Hero(
                tag: pokemon.id,
                child: Image.network(
                  pokemon.sprites.other.officialArtwork.frontDefault,
                ),
              ),
            ),
          )
        ]),
        Text('Nº${pokemon.id.formatNumber}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        Text(
          toBeginningOfSentenceCase(pokemon.name) ?? '',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
