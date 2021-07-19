import 'package:dio/dio.dart';
import 'package:external/api/requests/get_all_pokemon_request.dart';
import 'package:retrofit/retrofit.dart';

import 'responses/pokemon_list_response.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://beta.pokeapi.co/graphql/v1beta")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/")
  Future<PokemonListResponse> getAllPokemons(
    @Body() GetAllPokemonRequest request,
  );
}
