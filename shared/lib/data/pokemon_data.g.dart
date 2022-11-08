// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonDataAdapter extends TypeAdapter<PokemonData> {
  @override
  final int typeId = 0;

  @override
  PokemonData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonData(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      primaryType: fields[3] as PokemonType,
      secondaryType: fields[4] as PokemonType?,
      baseExperience: fields[5] as int?,
      height: fields[6] as int?,
      weight: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.primaryType)
      ..writeByte(4)
      ..write(obj.secondaryType)
      ..writeByte(5)
      ..write(obj.baseExperience)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
