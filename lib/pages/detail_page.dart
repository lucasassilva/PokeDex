import 'package:flutter/material.dart';
import 'package:pokedex_tarde/models/pokemon_model.dart';
import 'package:pokedex_tarde/widgets/horizontal_bar.dart';
import 'package:pokedex_tarde/widgets/metric_tile.dart';
import 'package:pokedex_tarde/widgets/poke_header.dart';
import 'package:pokedex_tarde/widgets/poke_type_chip.dart';
import 'package:pokedex_tarde/helpers/poke_helper.dart';

class DetailPage extends StatefulWidget {

  final PokemonModel? pokemon;

  const DetailPage({
    Key ? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(pokemon!);
}

class _DetailPageState extends State<DetailPage> {

  final PokemonModel ?pokemon;

  _DetailPageState(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
              PokeHelper.getColor(pokemon!.type1!),
              pokemon!.type2!=null
                  ? PokeHelper.getColor(pokemon!.type2!)
                  : PokeHelper.getColor(pokemon!.type1!),
            ]),
          ),
        ),
        title: Text(widget.pokemon!.name!),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            width: 80,
            height: 52,
            child: Center(
              child: Text(
                '#${widget.pokemon!.id.toString().padLeft(3, '0')}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PokeHeader(
              imageUrl: widget.pokemon!.imageUrl!,
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
                colors: [
                    pokemon!.type2!=null? PokeHelper.getColor(pokemon!.type2!): PokeHelper.getColor(pokemon!.type1!),
                    PokeHelper.getColor(pokemon!.type1!),
                ],
               ),
              ), 
             ),
            _buildMetrics(),
            _buildTypeChips(),
            _buildStatistics(),
            _buildMoves(),
          ],
        ),
      ),
    );
  }


  _buildMoves(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Divider(),
          ),
          Text(
            'Moves',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            pokemon!.move!,
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }


  _buildStatistics() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Divider(),
          ),
          Text(
            'Statistics',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          HorizontalBar(
            label: 'HP',
            value: widget.pokemon!.health!,
            foregroundColor: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                  pokemon!.type2!=null? PokeHelper.getColor(pokemon!.type2!): PokeHelper.getColor(pokemon!.type1!),
                  PokeHelper.getColor(pokemon!.type1!),
              ],
            ),
           ),
          HorizontalBar(
            label: 'ATK',
            value: widget.pokemon!.attack!,
             foregroundColor: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                  pokemon!.type2!=null? PokeHelper.getColor(pokemon!.type2!): PokeHelper.getColor(pokemon!.type1!),
                  PokeHelper.getColor(pokemon!.type1!),
              ],
            ),
          ),
          HorizontalBar(
            label: 'DEF',
            value: widget.pokemon!.defense!,
            foregroundColor: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                  pokemon!.type2!=null? PokeHelper.getColor(pokemon!.type2!): PokeHelper.getColor(pokemon!.type1!),
                  PokeHelper.getColor(pokemon!.type1!),
              ],
            ),
          ),
          HorizontalBar(
            label: 'SPD',
            value: widget.pokemon!.speed!,
             foregroundColor: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                  pokemon!.type2!=null? PokeHelper.getColor(pokemon!.type2!): PokeHelper.getColor(pokemon!.type1!),
                  PokeHelper.getColor(pokemon!.type1!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTypeChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PokeTypeChip(type: widget.pokemon!.type1!),
        SizedBox(width: widget.pokemon!.type2!=null ? 20.0 : 0.0),
        widget.pokemon!.type2!=null
            ? PokeTypeChip(type: widget.pokemon!.type2!)
            : SizedBox(),
      ],
    );
  }

  _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MetricTile(
          label: 'Weight',
          unit: 'kg',
          value: widget.pokemon!.weight! / 10.0,
        ),
        MetricTile(
          label: 'Height',
          unit: 'm',
          value: widget.pokemon!.height! / 10.0,
        ),
      ],
    );
  }
}
