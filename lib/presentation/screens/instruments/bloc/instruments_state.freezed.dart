// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstrumentsState {
  Status get status => throw _privateConstructorUsedError;
  Iterable<MusicalInstrument> get instruments =>
      throw _privateConstructorUsedError;
  bool get isFromFirebase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstrumentsStateCopyWith<InstrumentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstrumentsStateCopyWith<$Res> {
  factory $InstrumentsStateCopyWith(
          InstrumentsState value, $Res Function(InstrumentsState) then) =
      _$InstrumentsStateCopyWithImpl<$Res, InstrumentsState>;
  @useResult
  $Res call(
      {Status status,
      Iterable<MusicalInstrument> instruments,
      bool isFromFirebase});
}

/// @nodoc
class _$InstrumentsStateCopyWithImpl<$Res, $Val extends InstrumentsState>
    implements $InstrumentsStateCopyWith<$Res> {
  _$InstrumentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? instruments = null,
    Object? isFromFirebase = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      instruments: null == instruments
          ? _value.instruments
          : instruments // ignore: cast_nullable_to_non_nullable
              as Iterable<MusicalInstrument>,
      isFromFirebase: null == isFromFirebase
          ? _value.isFromFirebase
          : isFromFirebase // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstrumentsStateCopyWith<$Res>
    implements $InstrumentsStateCopyWith<$Res> {
  factory _$$_InstrumentsStateCopyWith(
          _$_InstrumentsState value, $Res Function(_$_InstrumentsState) then) =
      __$$_InstrumentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Iterable<MusicalInstrument> instruments,
      bool isFromFirebase});
}

/// @nodoc
class __$$_InstrumentsStateCopyWithImpl<$Res>
    extends _$InstrumentsStateCopyWithImpl<$Res, _$_InstrumentsState>
    implements _$$_InstrumentsStateCopyWith<$Res> {
  __$$_InstrumentsStateCopyWithImpl(
      _$_InstrumentsState _value, $Res Function(_$_InstrumentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? instruments = null,
    Object? isFromFirebase = null,
  }) {
    return _then(_$_InstrumentsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      instruments: null == instruments
          ? _value.instruments
          : instruments // ignore: cast_nullable_to_non_nullable
              as Iterable<MusicalInstrument>,
      isFromFirebase: null == isFromFirebase
          ? _value.isFromFirebase
          : isFromFirebase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InstrumentsState implements _InstrumentsState {
  const _$_InstrumentsState(
      {this.status = Status.initial,
      this.instruments = const [],
      this.isFromFirebase = true});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Iterable<MusicalInstrument> instruments;
  @override
  @JsonKey()
  final bool isFromFirebase;

  @override
  String toString() {
    return 'InstrumentsState(status: $status, instruments: $instruments, isFromFirebase: $isFromFirebase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstrumentsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.instruments, instruments) &&
            (identical(other.isFromFirebase, isFromFirebase) ||
                other.isFromFirebase == isFromFirebase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(instruments), isFromFirebase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstrumentsStateCopyWith<_$_InstrumentsState> get copyWith =>
      __$$_InstrumentsStateCopyWithImpl<_$_InstrumentsState>(this, _$identity);
}

abstract class _InstrumentsState implements InstrumentsState {
  const factory _InstrumentsState(
      {final Status status,
      final Iterable<MusicalInstrument> instruments,
      final bool isFromFirebase}) = _$_InstrumentsState;

  @override
  Status get status;
  @override
  Iterable<MusicalInstrument> get instruments;
  @override
  bool get isFromFirebase;
  @override
  @JsonKey(ignore: true)
  _$$_InstrumentsStateCopyWith<_$_InstrumentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
