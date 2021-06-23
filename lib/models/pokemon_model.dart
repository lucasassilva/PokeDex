class PokemonModel {

  int ?id;
  String ?move;
  String ?name;
  String ?imageUrl;
  int ?weight;
  int ?height;
  String ?type1;
  String ?type2;
  int ?health;
  int ?attack;
  int ?defense;
  int ?speed;

  PokemonModel({
    required this.id,
    required this.move,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.height,
    required this.type1,
    required this.type2,
    required this.health,
    required this.attack,
    required this.defense,
    required this.speed,
  });
  

  factory PokemonModel.fromMap(Map<String, dynamic> map) {

    final id = map['id'];
    final typeList = map['types'] as List;
    final statList = map['stats'] as List;
    final moveList = map['moves'] as List;

    String move = '';

    for(int i=0; i<moveList.length; i++){ move+= '\n' + moveList[i]['move']['name'];} 
    
    return PokemonModel(
      id: id,
      move: move,
      name: map['name'],
      weight: map['weight'],
      height: map['height'],
      imageUrl:'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      type1: typeList[0]['type']['name'],
      type2: typeList.length == 2 ? typeList[1]['type']['name'] : null,
      health: statList[0]['base_stat'],
      attack: statList[1]['base_stat'],
      defense: statList[2]['base_stat'],
      speed: statList[5]['base_stat'],
    );

  }
  
}
