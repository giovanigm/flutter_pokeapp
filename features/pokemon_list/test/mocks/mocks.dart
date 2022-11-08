import 'package:mockito/annotations.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:shared/data/pokemon_dao.dart';

export 'mocks.mocks.dart';

@GenerateMocks([
  PokemonApi,
  PokemonDao,
])
class Mocks {}
