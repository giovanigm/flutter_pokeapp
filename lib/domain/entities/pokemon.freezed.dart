// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PokemonTearOff {
  const _$PokemonTearOff();

// ignore: unused_element
  _Pokemon call(
      {@required int id,
      @required String name,
      @required String imageUrl,
      int baseExperience,
      int height,
      int weight,
      List<PokemonType> types}) {
    return _Pokemon(
      id: id,
      name: name,
      imageUrl: imageUrl,
      baseExperience: baseExperience,
      height: height,
      weight: weight,
      types: types,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Pokemon = _$PokemonTearOff();

/// @nodoc
mixin _$Pokemon {
  int get id;
  String get name;
  String get imageUrl;
  int get baseExperience;
  int get height;
  int get weight;
  List<PokemonType> get types;

  $PokemonCopyWith<Pokemon> get copyWith;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String imageUrl,
      int baseExperience,
      int height,
      int weight,
      List<PokemonType> types});
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res> implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  final Pokemon _value;
  // ignore: unused_field
  final $Res Function(Pokemon) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object imageUrl = freezed,
    Object baseExperience = freezed,
    Object height = freezed,
    Object weight = freezed,
    Object types = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      baseExperience: baseExperience == freezed
          ? _value.baseExperience
          : baseExperience as int,
      height: height == freezed ? _value.height : height as int,
      weight: weight == freezed ? _value.weight : weight as int,
      types: types == freezed ? _value.types : types as List<PokemonType>,
    ));
  }
}

/// @nodoc
abstract class _$PokemonCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$PokemonCopyWith(_Pokemon value, $Res Function(_Pokemon) then) =
      __$PokemonCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String imageUrl,
      int baseExperience,
      int height,
      int weight,
      List<PokemonType> types});
}

/// @nodoc
class __$PokemonCopyWithImpl<$Res> extends _$PokemonCopyWithImpl<$Res>
    implements _$PokemonCopyWith<$Res> {
  __$PokemonCopyWithImpl(_Pokemon _value, $Res Function(_Pokemon) _then)
      : super(_value, (v) => _then(v as _Pokemon));

  @override
  _Pokemon get _value => super._value as _Pokemon;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object imageUrl = freezed,
    Object baseExperience = freezed,
    Object height = freezed,
    Object weight = freezed,
    Object types = freezed,
  }) {
    return _then(_Pokemon(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      baseExperience: baseExperience == freezed
          ? _value.baseExperience
          : baseExperience as int,
      height: height == freezed ? _value.height : height as int,
      weight: weight == freezed ? _value.weight : weight as int,
      types: types == freezed ? _value.types : types as List<PokemonType>,
    ));
  }
}

/// @nodoc
class _$_Pokemon with DiagnosticableTreeMixin implements _Pokemon {
  const _$_Pokemon(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      this.baseExperience,
      this.height,
      this.weight,
      this.types})
      : assert(id != null),
        assert(name != null),
        assert(imageUrl != null);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final int baseExperience;
  @override
  final int height;
  @override
  final int weight;
  @override
  final List<PokemonType> types;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Pokemon(id: $id, name: $name, imageUrl: $imageUrl, baseExperience: $baseExperience, height: $height, weight: $weight, types: $types)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Pokemon'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('baseExperience', baseExperience))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('types', types));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pokemon &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.baseExperience, baseExperience) ||
                const DeepCollectionEquality()
                    .equals(other.baseExperience, baseExperience)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.types, types) ||
                const DeepCollectionEquality().equals(other.types, types)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(baseExperience) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(types);

  @override
  _$PokemonCopyWith<_Pokemon> get copyWith =>
      __$PokemonCopyWithImpl<_Pokemon>(this, _$identity);
}

abstract class _Pokemon implements Pokemon {
  const factory _Pokemon(
      {@required int id,
      @required String name,
      @required String imageUrl,
      int baseExperience,
      int height,
      int weight,
      List<PokemonType> types}) = _$_Pokemon;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  int get baseExperience;
  @override
  int get height;
  @override
  int get weight;
  @override
  List<PokemonType> get types;
  @override
  _$PokemonCopyWith<_Pokemon> get copyWith;
}
