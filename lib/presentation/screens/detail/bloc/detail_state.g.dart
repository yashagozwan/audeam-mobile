// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailState _$$_DetailStateFromJson(Map<String, dynamic> json) =>
    _$_DetailState(
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']) ??
          Status.initial,
      instrument: json['instrument'] == null
          ? const MusicalInstrument()
          : MusicalInstrument.fromJson(
              json['instrument'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DetailStateToJson(_$_DetailState instance) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
      'instrument': instance.instrument,
    };

const _$StatusEnumMap = {
  Status.initial: 'initial',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.failure: 'failure',
};
