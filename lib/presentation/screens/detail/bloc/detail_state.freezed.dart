// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailState _$DetailStateFromJson(Map<String, dynamic> json) {
  return _DetailState.fromJson(json);
}

/// @nodoc
mixin _$DetailState {
  Status get status => throw _privateConstructorUsedError;
  MusicalInstrument get instrument => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call({Status status, MusicalInstrument instrument});

  $MusicalInstrumentCopyWith<$Res> get instrument;
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? instrument = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      instrument: null == instrument
          ? _value.instrument
          : instrument // ignore: cast_nullable_to_non_nullable
              as MusicalInstrument,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicalInstrumentCopyWith<$Res> get instrument {
    return $MusicalInstrumentCopyWith<$Res>(_value.instrument, (value) {
      return _then(_value.copyWith(instrument: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailStateCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$_DetailStateCopyWith(
          _$_DetailState value, $Res Function(_$_DetailState) then) =
      __$$_DetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, MusicalInstrument instrument});

  @override
  $MusicalInstrumentCopyWith<$Res> get instrument;
}

/// @nodoc
class __$$_DetailStateCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$_DetailState>
    implements _$$_DetailStateCopyWith<$Res> {
  __$$_DetailStateCopyWithImpl(
      _$_DetailState _value, $Res Function(_$_DetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? instrument = null,
  }) {
    return _then(_$_DetailState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      instrument: null == instrument
          ? _value.instrument
          : instrument // ignore: cast_nullable_to_non_nullable
              as MusicalInstrument,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailState implements _DetailState {
  const _$_DetailState(
      {this.status = Status.initial,
      this.instrument = const MusicalInstrument()});

  factory _$_DetailState.fromJson(Map<String, dynamic> json) =>
      _$$_DetailStateFromJson(json);

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final MusicalInstrument instrument;

  @override
  String toString() {
    return 'DetailState(status: $status, instrument: $instrument)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.instrument, instrument) ||
                other.instrument == instrument));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, instrument);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailStateCopyWith<_$_DetailState> get copyWith =>
      __$$_DetailStateCopyWithImpl<_$_DetailState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailStateToJson(
      this,
    );
  }
}

abstract class _DetailState implements DetailState {
  const factory _DetailState(
      {final Status status,
      final MusicalInstrument instrument}) = _$_DetailState;

  factory _DetailState.fromJson(Map<String, dynamic> json) =
      _$_DetailState.fromJson;

  @override
  Status get status;
  @override
  MusicalInstrument get instrument;
  @override
  @JsonKey(ignore: true)
  _$$_DetailStateCopyWith<_$_DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
