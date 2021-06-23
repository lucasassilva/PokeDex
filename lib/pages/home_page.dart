import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:pokedex_tarde/controllers/home_controller.dart';
import 'package:pokedex_tarde/core/app_const.dart';
import 'package:pokedex_tarde/pages/detail_page.dart';
import 'package:pokedex_tarde/repositories/poke_repository_impl.dart';
import 'package:pokedex_tarde/widgets/custom_search.dart';
import 'package:pokedex_tarde/widgets/poke_card.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


final _controller = HomeController(PokeRepositoryImpl());


class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await _controller.fetch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        kAppTitle, 
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'PokemonSolid',
            fontSize: 25.0
          )
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,color: Colors.black, 
              size: 26.0
              ), 
              alignment: Alignment.center,
              onPressed: () => {
                  showSearch(
                    context: context,
                    delegate: CustomSearchPokemon(),
                  )
              },)
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: InfiniteGridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: _buildCard,
        itemCount: _controller.length,
        hasNext: _controller.length < 1118,
        nextData: _onNext,
      
      ),
    );
  }

  Future<void> _onNext() async {
    await _controller.next();
    setState(() {});
  }

  Widget _buildCard(BuildContext context, int index) {
    final pokemon = _controller.pokemons[index];
    return PokemonCard(
      pokemon: pokemon,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
    );
  }
  
}