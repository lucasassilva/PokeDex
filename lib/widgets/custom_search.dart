import 'package:flutter/material.dart';

class CustomSearchPokemon extends SearchDelegate {

 // final PokemonModel pokemon!;
  
  @override
  List<Widget> buildActions(BuildContext context) {
     return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = ''
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Text('results');

  @override
  Widget buildSuggestions(BuildContext context) => Text('suggestions');
  /*@override
  Widget buildSuggestions(BuildContext context) {
  final suggestionList = _controller.pokemons.where((c) => c.name.toString().startsWith(query)).toList();
  final pokemon = _controller.pokemons;
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.catching_pokemon_sharp),
      title: Text(pokemon[index].name.toString()),
    ), itemCount: suggestionList.length);
  }*/

}
