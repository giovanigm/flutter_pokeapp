import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'responses/pokemon_info_response.dart';
import 'responses/pokemon_list_response.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/pokemon")
  Future<PokemonListResponse> getAllPokemons({
    @Query("limit") required int limit,
    @Query("offset") required int offset,
  });

  @GET("/pokemon/{id}")
  Future<PokemonInfoResponse> getPokemonInfo(@Path() int id);
}
