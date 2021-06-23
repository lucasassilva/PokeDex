class PokemonResultModel {
  final String name;
  final String url;

  const PokemonResultModel({required this.name, required this.url});

  factory PokemonResultModel.fromMap(Map<String, dynamic> map) {
    return PokemonResultModel(
      name: map['name'],
      url: map['url'],
    );
  }
}
