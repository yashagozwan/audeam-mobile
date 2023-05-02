// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'musical_instrument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicalInstrument _$MusicalInstrumentFromJson(Map<String, dynamic> json) {
  return _MusicalInstrument.fromJson(json);
}

/// @nodoc
mixin _$MusicalInstrument {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicalInstrumentCopyWith<MusicalInstrument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicalInstrumentCopyWith<$Res> {
  factory $MusicalInstrumentCopyWith(
          MusicalInstrument value, $Res Function(MusicalInstrument) then) =
      _$MusicalInstrumentCopyWithImpl<$Res, MusicalInstrument>;
  @useResult
  $Res call({String id, String name, String description, String image});
}

/// @nodoc
class _$MusicalInstrumentCopyWithImpl<$Res, $Val extends MusicalInstrument>
    implements $MusicalInstrumentCopyWith<$Res> {
  _$MusicalInstrumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MusicalInstrumentCopyWith<$Res>
    implements $MusicalInstrumentCopyWith<$Res> {
  factory _$$_MusicalInstrumentCopyWith(_$_MusicalInstrument value,
          $Res Function(_$_MusicalInstrument) then) =
      __$$_MusicalInstrumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description, String image});
}

/// @nodoc
class __$$_MusicalInstrumentCopyWithImpl<$Res>
    extends _$MusicalInstrumentCopyWithImpl<$Res, _$_MusicalInstrument>
    implements _$$_MusicalInstrumentCopyWith<$Res> {
  __$$_MusicalInstrumentCopyWithImpl(
      _$_MusicalInstrument _value, $Res Function(_$_MusicalInstrument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$_MusicalInstrument(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MusicalInstrument implements _MusicalInstrument {
  const _$_MusicalInstrument(
      {this.id = '', this.name = '', this.description = '', this.image = ''});

  factory _$_MusicalInstrument.fromJson(Map<String, dynamic> json) =>
      _$$_MusicalInstrumentFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String image;

  @override
  String toString() {
    return 'MusicalInstrument(id: $id, name: $name, description: $description, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicalInstrument &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicalInstrumentCopyWith<_$_MusicalInstrument> get copyWith =>
      __$$_MusicalInstrumentCopyWithImpl<_$_MusicalInstrument>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicalInstrumentToJson(
      this,
    );
  }
}

abstract class _MusicalInstrument implements MusicalInstrument {
  const factory _MusicalInstrument(
      {final String id,
      final String name,
      final String description,
      final String image}) = _$_MusicalInstrument;

  factory _MusicalInstrument.fromJson(Map<String, dynamic> json) =
      _$_MusicalInstrument.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_MusicalInstrumentCopyWith<_$_MusicalInstrument> get copyWith =>
      throw _privateConstructorUsedError;
}
