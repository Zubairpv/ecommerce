// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class modelAdapter extends TypeAdapter<model> {
  @override

  final int typeId = 0;

  @override
  model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return model(
      id: fields[0] as int?,
      name: fields[1] as String,
      brand: fields[2] as String,
      price: fields[3] as int,
      image: fields[4] as String,
      quantity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, model obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is modelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
