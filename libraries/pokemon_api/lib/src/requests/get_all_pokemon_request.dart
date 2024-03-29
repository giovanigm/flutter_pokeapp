import 'request.dart';

class GetAllPokemonRequest extends Request {
  GetAllPokemonRequest()
      : super(
          operationName: "getAllPokemon",
          query: """
          query getAllPokemon {
            pokemon: pokemon_v2_pokemon(order_by: {id: asc}, where: {id: {_lt: 10000}}) {
              base_experience
              height
              id
              species: pokemon_v2_pokemonspecy {
                name
              }
              types: pokemon_v2_pokemontypes {
                type: pokemon_v2_type {
                  name
                }
              }
              weight
            }
          }
          """,
        );
}
