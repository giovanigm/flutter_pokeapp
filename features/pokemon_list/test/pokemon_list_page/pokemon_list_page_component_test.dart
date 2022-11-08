import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page_cubit.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page_model.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page_state.dart';

import '../fixtures/pokemon_data_fixture.dart';
import '../fixtures/pokemon_fixture.dart';
import '../fixtures/pokemon_response_fixture.dart';
import '../mocks/mocks.dart';

void main() {
  late MockPokemonApi api;
  late MockPokemonDao dao;
  late PokemonListPageModel model;

  setUp(() async {
    api = MockPokemonApi();
    dao = MockPokemonDao();
    model = PokemonListPageModel(api, dao);
  });

  blocTest<PokemonListPageCubit, PokemonListPageState>(
    "should fetch pokemon list from api, save it in cache and emit state with correct pokemon list",
    build: () {
      when(api.getAllPokemons(any)).thenAnswer(
        (realInvocation) async => PokemonResponseFixture.pokemonListResponse,
      );

      when(dao.getAllPokemons()).thenAnswer((_) => []);
      return PokemonListPageCubit(model);
    },
    act: (cubit) => cubit.loadPokemons(),
    expect: () => [
      PokemonListPageState(
        pokemons: PokemonFixture.pokemon,
        isLoading: false,
        errorOccurred: false,
      )
    ],
    verify: (cubit) {
      dao.saveAll(PokemonDataFixture.pokemons);
    },
  );

  blocTest<PokemonListPageCubit, PokemonListPageState>(
    "should get pokemon list only from cache and emit state with correct pokemon list",
    build: () {
      when(dao.getAllPokemons()).thenAnswer((_) => PokemonDataFixture.pokemons);
      return PokemonListPageCubit(model);
    },
    act: (cubit) => cubit.loadPokemons(),
    expect: () => [
      PokemonListPageState(
        pokemons: PokemonFixture.pokemon,
        isLoading: false,
        errorOccurred: false,
      )
    ],
    verify: (cubit) {
      verifyNever(dao.saveAll(any));
      verifyNever(api.getAllPokemons(any));
    },
  );

  blocTest<PokemonListPageCubit, PokemonListPageState>(
    "should emit state with error",
    build: () {
      when(api.getAllPokemons(any)).thenThrow(Exception());

      when(dao.getAllPokemons()).thenAnswer((realInvocation) => []);
      when(dao.saveAll(any)).thenAnswer((realInvocation) async => []);
      return PokemonListPageCubit(model);
    },
    act: (cubit) => cubit.loadPokemons(),
    expect: () => [
      const PokemonListPageState(
        pokemons: [],
        isLoading: false,
        errorOccurred: true,
      )
    ],
  );
}
