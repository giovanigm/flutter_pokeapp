// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pokemon_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PokemonListStateTearOff {
  const _$PokemonListStateTearOff();

// ignore: unused_element
  _PokemonListState call(
      {@required List<Pokemon> list, @required bool isLoading}) {
    return _PokemonListState(
      list: list,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PokemonListState = _$PokemonListStateTearOff();

/// @nodoc
mixin _$PokemonListState {
  List<Pokemon> get list;
  bool get isLoading;

  $PokemonListStateCopyWith<PokemonListState> get copyWith;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
          PokemonListState value, $Res Function(PokemonListState) then) =
      _$PokemonListStateCopyWithImpl<$Res>;
  $Res call({List<Pokemon> list, bool isLoading});
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  final PokemonListState _value;
  // ignore: unused_field
  final $Res Function(PokemonListState) _then;

  @override
  $Res call({
    Object list = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed ? _value.list : list as List<Pokemon>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
abstract class _$PokemonListStateCopyWith<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  factory _$PokemonListStateCopyWith(
          _PokemonListState value, $Res Function(_PokemonListState) then) =
      __$PokemonListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Pokemon> list, bool isLoading});
}

/// @nodoc
class __$PokemonListStateCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res>
    implements _$PokemonListStateCopyWith<$Res> {
  __$PokemonListStateCopyWithImpl(
      _PokemonListState _value, $Res Function(_PokemonListState) _then)
      : super(_value, (v) => _then(v as _PokemonListState));

  @override
  _PokemonListState get _value => super._value as _PokemonListState;

  @override
  $Res call({
    Object list = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_PokemonListState(
      list: list == freezed ? _value.list : list as List<Pokemon>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
class _$_PokemonListState implements _PokemonListState {
  const _$_PokemonListState({@required this.list, @required this.isLoading})
      : assert(list != null),
        assert(isLoading != null);

  @override
  final List<Pokemon> list;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PokemonListState(list: $list, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonListState &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(list) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$PokemonListStateCopyWith<_PokemonListState> get copyWith =>
      __$PokemonListStateCopyWithImpl<_PokemonListState>(this, _$identity);
}

abstract class _PokemonListState implements PokemonListState {
  const factory _PokemonListState(
      {@required List<Pokemon> list,
      @required bool isLoading}) = _$_PokemonListState;

  @override
  List<Pokemon> get list;
  @override
  bool get isLoading;
  @override
  _$PokemonListStateCopyWith<_PokemonListState> get copyWith;
}
