import 'package:flutter/foundation.dart';
import 'package:pokeapp/data/api/responses/pokemon_info_response.dart';
import 'package:pokeapp/data/api/responses/pokemon_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/pokemon")
  Future<PokemonListResponse> getAllPokemons(
      {@Query("limit") @required int limit,
      @Query("offset") @required int offset});

  @GET("/pokemon/{id}")
  Future<PokemonInfoResponse> getPokemonInfo(@Path() int id);
}
