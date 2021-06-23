import 'package:flutter/material.dart';
import 'package:pokedex_tarde/helpers/poke_helper.dart';

import 'package:pokedex_tarde/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  
  final PokemonModel ?pokemon;
  final VoidCallback onPressed;

  const PokemonCard({
    Key ? key,
    required this.pokemon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                  PokeHelper.getColor(pokemon!.type1!),
                  pokemon!.type2!=null ? PokeHelper.getColor(pokemon!.type2!): PokeHelper.getColor(pokemon!.type1!),
              ],
            ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                pokemon!.imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              pokemon!.name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
