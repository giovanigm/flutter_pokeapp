// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokemon_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonDetailsStateTearOff {
  const _$PokemonDetailsStateTearOff();

  _PokemonDetailsState call(
      {required Pokemon? pokemon, required bool isLoading}) {
    return _PokemonDetailsState(
      pokemon: pokemon,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $PokemonDetailsState = _$PokemonDetailsStateTearOff();

/// @nodoc
mixin _$PokemonDetailsState {
  Pokemon? get pokemon => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonDetailsStateCopyWith<PokemonDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsStateCopyWith<$Res> {
  factory $PokemonDetailsStateCopyWith(
          PokemonDetailsState value, $Res Function(PokemonDetailsState) then) =
      _$PokemonDetailsStateCopyWithImpl<$Res>;
  $Res call({Pokemon? pokemon, bool isLoading});

  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class _$PokemonDetailsStateCopyWithImpl<$Res>
    implements $PokemonDetailsStateCopyWith<$Res> {
  _$PokemonDetailsStateCopyWithImpl(this._value, this._then);

  final PokemonDetailsState _value;
  // ignore: unused_field
  final $Res Function(PokemonDetailsState) _then;

  @override
  $Res call({
    Object? pokemon = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      pokemon: pokemon == freezed
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $PokemonCopyWith<$Res>? get pokemon {
    if (_value.pokemon == null) {
      return null;
    }

    return $PokemonCopyWith<$Res>(_value.pokemon!, (value) {
      return _then(_value.copyWith(pokemon: value));
    });
  }
}

/// @nodoc
abstract class _$PokemonDetailsStateCopyWith<$Res>
    implements $PokemonDetailsStateCopyWith<$Res> {
  factory _$PokemonDetailsStateCopyWith(_PokemonDetailsState value,
          $Res Function(_PokemonDetailsState) then) =
      __$PokemonDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({Pokemon? pokemon, bool isLoading});

  @override
  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class __$PokemonDetailsStateCopyWithImpl<$Res>
    extends _$PokemonDetailsStateCopyWithImpl<$Res>
    implements _$PokemonDetailsStateCopyWith<$Res> {
  __$PokemonDetailsStateCopyWithImpl(
      _PokemonDetailsState _value, $Res Function(_PokemonDetailsState) _then)
      : super(_value, (v) => _then(v as _PokemonDetailsState));

  @override
  _PokemonDetailsState get _value => super._value as _PokemonDetailsState;

  @override
  $Res call({
    Object? pokemon = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_PokemonDetailsState(
      pokemon: pokemon == freezed
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_PokemonDetailsState extends _PokemonDetailsState {
  const _$_PokemonDetailsState({required this.pokemon, required this.isLoading})
      : super._();

  @override
  final Pokemon? pokemon;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PokemonDetailsState(pokemon: $pokemon, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonDetailsState &&
            (identical(other.pokemon, pokemon) ||
                const DeepCollectionEquality()
                    .equals(other.pokemon, pokemon)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pokemon) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$PokemonDetailsStateCopyWith<_PokemonDetailsState> get copyWith =>
      __$PokemonDetailsStateCopyWithImpl<_PokemonDetailsState>(
          this, _$identity);
}

abstract class _PokemonDetailsState extends PokemonDetailsState {
  const factory _PokemonDetailsState(
      {required Pokemon? pokemon,
      required bool isLoading}) = _$_PokemonDetailsState;
  const _PokemonDetailsState._() : super._();

  @override
  Pokemon? get pokemon => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonDetailsStateCopyWith<_PokemonDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
