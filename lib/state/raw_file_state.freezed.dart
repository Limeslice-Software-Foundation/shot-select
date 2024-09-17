// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_file_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RawFileState {
  List<RawFile> get files => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  /// Create a copy of RawFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RawFileStateCopyWith<RawFileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawFileStateCopyWith<$Res> {
  factory $RawFileStateCopyWith(
          RawFileState value, $Res Function(RawFileState) then) =
      _$RawFileStateCopyWithImpl<$Res, RawFileState>;
  @useResult
  $Res call({List<RawFile> files, bool isLoading, bool isError});
}

/// @nodoc
class _$RawFileStateCopyWithImpl<$Res, $Val extends RawFileState>
    implements $RawFileStateCopyWith<$Res> {
  _$RawFileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RawFileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<RawFile>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RawFileStateImplCopyWith<$Res>
    implements $RawFileStateCopyWith<$Res> {
  factory _$$RawFileStateImplCopyWith(
          _$RawFileStateImpl value, $Res Function(_$RawFileStateImpl) then) =
      __$$RawFileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RawFile> files, bool isLoading, bool isError});
}

/// @nodoc
class __$$RawFileStateImplCopyWithImpl<$Res>
    extends _$RawFileStateCopyWithImpl<$Res, _$RawFileStateImpl>
    implements _$$RawFileStateImplCopyWith<$Res> {
  __$$RawFileStateImplCopyWithImpl(
      _$RawFileStateImpl _value, $Res Function(_$RawFileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RawFileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$RawFileStateImpl(
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<RawFile>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RawFileStateImpl implements _RawFileState {
  const _$RawFileStateImpl(
      {required final List<RawFile> files,
      this.isLoading = false,
      this.isError = false})
      : _files = files;

  final List<RawFile> _files;
  @override
  List<RawFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;

  @override
  String toString() {
    return 'RawFileState(files: $files, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RawFileStateImpl &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_files), isLoading, isError);

  /// Create a copy of RawFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RawFileStateImplCopyWith<_$RawFileStateImpl> get copyWith =>
      __$$RawFileStateImplCopyWithImpl<_$RawFileStateImpl>(this, _$identity);
}

abstract class _RawFileState implements RawFileState {
  const factory _RawFileState(
      {required final List<RawFile> files,
      final bool isLoading,
      final bool isError}) = _$RawFileStateImpl;

  @override
  List<RawFile> get files;
  @override
  bool get isLoading;
  @override
  bool get isError;

  /// Create a copy of RawFileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RawFileStateImplCopyWith<_$RawFileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
