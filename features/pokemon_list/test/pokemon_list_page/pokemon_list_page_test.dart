import 'package:bloc_test/bloc_test.dart';
import 'package:feature_commons/feature_commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;
import 'package:pokemon_list/pokemon_list_module.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page_cubit.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page_state.dart';
import 'package:pokemon_list/pokemon_list_page/widgets/pokemon_list_item.dart';

import '../fixtures/pokemon_fixture.dart';

class MockPokemonListPageCubit extends MockCubit<PokemonListPageState>
    implements PokemonListPageCubit {}

void main() {
  late MockPokemonListPageCubit cubit;

  setUp(() {
    getIt = GetIt.instance;

    cubit = MockPokemonListPageCubit();

    getIt.registerSingleton<PokemonListPageCubit>(cubit);

    mocktail.registerFallbackValue(PokemonListPageState.initial());
    mocktail.when(() => cubit.loadPokemons()).thenAnswer((_) => Future.value());
  });

  tearDown(() async {
    await getIt.reset(dispose: true);
    mocktail.reset(cubit);
  });

  group("PokemonListPage", () {
    testWidgets("should render only progress indicator as initital state",
        (tester) async {
      whenListen(
        cubit,
        Stream.value(PokemonListPageState.initial()),
        initialState: PokemonListPageState.initial(),
      );

      await tester.pumpWidget(const MaterialApp(home: PokemonListPage()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text("Error"), findsNothing);
      expect(find.byType(GridView), findsNothing);
    });

    testWidgets("should render only pokemon grid with PokemonListItems",
        (tester) async {
      final state = PokemonListPageState(
        pokemons: PokemonFixture.pokemon,
        isLoading: false,
        errorOccurred: false,
      );

      whenListen(
        cubit,
        Stream.value(state),
        initialState: state,
      );

      await tester.pumpWidget(const MaterialApp(home: PokemonListPage()));

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(PokemonListItem), findsNWidgets(2));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text("Error"), findsNothing);
    });

    testWidgets("should render error message", (tester) async {
      const state = PokemonListPageState(
        pokemons: [],
        isLoading: false,
        errorOccurred: true,
      );

      whenListen(
        cubit,
        Stream.value(state),
        initialState: state,
      );

      await tester.pumpWidget(const MaterialApp(home: PokemonListPage()));

      expect(find.text("Error"), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(GridView), findsNothing);
    });
  });
}
