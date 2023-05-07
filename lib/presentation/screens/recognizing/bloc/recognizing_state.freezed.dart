// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recognizing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecognizingState {
  bool get isRecording => throw _privateConstructorUsedError;
  Stream<Map<dynamic, dynamic>>? get result =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecognizingStateCopyWith<RecognizingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecognizingStateCopyWith<$Res> {
  factory $RecognizingStateCopyWith(
          RecognizingState value, $Res Function(RecognizingState) then) =
      _$RecognizingStateCopyWithImpl<$Res, RecognizingState>;
  @useResult
  $Res call({bool isRecording, Stream<Map<dynamic, dynamic>>? result});
}

/// @nodoc
class _$RecognizingStateCopyWithImpl<$Res, $Val extends RecognizingState>
    implements $RecognizingStateCopyWith<$Res> {
  _$RecognizingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Stream<Map<dynamic, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecognizingStateCopyWith<$Res>
    implements $RecognizingStateCopyWith<$Res> {
  factory _$$_RecognizingStateCopyWith(
          _$_RecognizingState value, $Res Function(_$_RecognizingState) then) =
      __$$_RecognizingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRecording, Stream<Map<dynamic, dynamic>>? result});
}

/// @nodoc
class __$$_RecognizingStateCopyWithImpl<$Res>
    extends _$RecognizingStateCopyWithImpl<$Res, _$_RecognizingState>
    implements _$$_RecognizingStateCopyWith<$Res> {
  __$$_RecognizingStateCopyWithImpl(
      _$_RecognizingState _value, $Res Function(_$_RecognizingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? result = freezed,
  }) {
    return _then(_$_RecognizingState(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Stream<Map<dynamic, dynamic>>?,
    ));
  }
}

/// @nodoc

class _$_RecognizingState implements _RecognizingState {
  const _$_RecognizingState({this.isRecording = false, this.result});

  @override
  @JsonKey()
  final bool isRecording;
  @override
  final Stream<Map<dynamic, dynamic>>? result;

  @override
  String toString() {
    return 'RecognizingState(isRecording: $isRecording, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecognizingState &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRecording, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecognizingStateCopyWith<_$_RecognizingState> get copyWith =>
      __$$_RecognizingStateCopyWithImpl<_$_RecognizingState>(this, _$identity);
}

abstract class _RecognizingState implements RecognizingState {
  const factory _RecognizingState(
      {final bool isRecording,
      final Stream<Map<dynamic, dynamic>>? result}) = _$_RecognizingState;

  @override
  bool get isRecording;
  @override
  Stream<Map<dynamic, dynamic>>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_RecognizingStateCopyWith<_$_RecognizingState> get copyWith =>
      throw _privateConstructorUsedError;
}
