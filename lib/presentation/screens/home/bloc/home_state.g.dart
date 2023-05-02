// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeState _$$_HomeStateFromJson(Map<String, dynamic> json) => _$_HomeState(
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']) ??
          Status.initial,
      instruments: (json['instruments'] as List<dynamic>?)?.map(
              (e) => MusicalInstrument.fromJson(e as Map<String, dynamic>)) ??
          const [],
    );

Map<String, dynamic> _$$_HomeStateToJson(_$_HomeState instance) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
      'instruments': instance.instruments.toList(),
    };

const _$StatusEnumMap = {
  Status.initial: 'initial',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.failure: 'failure',
};
