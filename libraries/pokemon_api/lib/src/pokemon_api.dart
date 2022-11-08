import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'requests/get_all_pokemon_request.dart';
import 'responses/pokemon_list_response.dart';

export 'requests/get_all_pokemon_request.dart';
export 'responses/pokemon_list_response.dart';

part 'pokemon_api.g.dart';

@RestApi(baseUrl: "https://beta.pokeapi.co/graphql/v1beta")
abstract class PokemonApi {
  factory PokemonApi() {
    return _PokemonApi(Dio());
  }

  @POST("/")
  Future<PokemonListResponse> getAllPokemons(
    @Body() GetAllPokemonRequest request,
  );
}
