// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonTypeAdapter extends TypeAdapter<PokemonType> {
  @override
  final int typeId = 1;

  @override
  PokemonType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PokemonType.bug;
      case 1:
        return PokemonType.dark;
      case 2:
        return PokemonType.dragon;
      case 3:
        return PokemonType.electric;
      case 4:
        return PokemonType.fairy;
      case 5:
        return PokemonType.fighting;
      case 6:
        return PokemonType.fire;
      case 7:
        return PokemonType.flying;
      case 8:
        return PokemonType.ghost;
      case 9:
        return PokemonType.grass;
      case 10:
        return PokemonType.ground;
      case 11:
        return PokemonType.ice;
      case 12:
        return PokemonType.normal;
      case 13:
        return PokemonType.poison;
      case 14:
        return PokemonType.psychic;
      case 15:
        return PokemonType.rock;
      case 16:
        return PokemonType.steel;
      case 17:
        return PokemonType.water;
      case 18:
        return PokemonType.undefined;
      default:
        return PokemonType.bug;
    }
  }

  @override
  void write(BinaryWriter writer, PokemonType obj) {
    switch (obj) {
      case PokemonType.bug:
        writer.writeByte(0);
        break;
      case PokemonType.dark:
        writer.writeByte(1);
        break;
      case PokemonType.dragon:
        writer.writeByte(2);
        break;
      case PokemonType.electric:
        writer.writeByte(3);
        break;
      case PokemonType.fairy:
        writer.writeByte(4);
        break;
      case PokemonType.fighting:
        writer.writeByte(5);
        break;
      case PokemonType.fire:
        writer.writeByte(6);
        break;
      case PokemonType.flying:
        writer.writeByte(7);
        break;
      case PokemonType.ghost:
        writer.writeByte(8);
        break;
      case PokemonType.grass:
        writer.writeByte(9);
        break;
      case PokemonType.ground:
        writer.writeByte(10);
        break;
      case PokemonType.ice:
        writer.writeByte(11);
        break;
      case PokemonType.normal:
        writer.writeByte(12);
        break;
      case PokemonType.poison:
        writer.writeByte(13);
        break;
      case PokemonType.psychic:
        writer.writeByte(14);
        break;
      case PokemonType.rock:
        writer.writeByte(15);
        break;
      case PokemonType.steel:
        writer.writeByte(16);
        break;
      case PokemonType.water:
        writer.writeByte(17);
        break;
      case PokemonType.undefined:
        writer.writeByte(18);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
