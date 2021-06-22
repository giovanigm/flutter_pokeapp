import 'package:domain/constants/pokemon_type.dart';
import 'package:domain/core/result.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_all_pokemons_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetAllPokemons usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetAllPokemons(mockPokemonRepository);
  });

  test("Should return list of pokemons", () async {
    const pokemons = [
      Pokemon(
          id: 1,
          name: "Bulbasaur",
          imageUrl: "",
          primaryType: PokemonType.grass,
          baseExperience: 67,
          height: 7,
          weight: 43),
      Pokemon(
          id: 2,
          name: "Ivysaur",
          imageUrl: "",
          primaryType: PokemonType.grass,
          baseExperience: 67,
          height: 7,
          weight: 43),
      Pokemon(
          id: 3,
          name: "Venossaur",
          imageUrl: "",
          primaryType: PokemonType.grass,
          baseExperience: 67,
          height: 7,
          weight: 43),
    ];

    const expectedResult = Result.success(value: pokemons);

    when(mockPokemonRepository.getAllPokemons())
        .thenAnswer((_) async => expectedResult);

    final result = await usecase();

    expect(result, expectedResult);

    verify(mockPokemonRepository.getAllPokemons());
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
