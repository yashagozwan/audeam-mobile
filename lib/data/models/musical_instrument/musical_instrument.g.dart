// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musical_instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MusicalInstrument _$$_MusicalInstrumentFromJson(Map<String, dynamic> json) =>
    _$_MusicalInstrument(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$_MusicalInstrumentToJson(
        _$_MusicalInstrument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
