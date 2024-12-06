// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileState {
  String get directory => throw _privateConstructorUsedError;
  List<RawFile> get rawFiles => throw _privateConstructorUsedError;
  bool get inProgress => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  int get current => throw _privateConstructorUsedError;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileStateCopyWith<FileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileStateCopyWith<$Res> {
  factory $FileStateCopyWith(FileState value, $Res Function(FileState) then) =
      _$FileStateCopyWithImpl<$Res, FileState>;
  @useResult
  $Res call(
      {String directory,
      List<RawFile> rawFiles,
      bool inProgress,
      bool isError,
      int current});
}

/// @nodoc
class _$FileStateCopyWithImpl<$Res, $Val extends FileState>
    implements $FileStateCopyWith<$Res> {
  _$FileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directory = null,
    Object? rawFiles = null,
    Object? inProgress = null,
    Object? isError = null,
    Object? current = null,
  }) {
    return _then(_value.copyWith(
      directory: null == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String,
      rawFiles: null == rawFiles
          ? _value.rawFiles
          : rawFiles // ignore: cast_nullable_to_non_nullable
              as List<RawFile>,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileStateImplCopyWith<$Res>
    implements $FileStateCopyWith<$Res> {
  factory _$$FileStateImplCopyWith(
          _$FileStateImpl value, $Res Function(_$FileStateImpl) then) =
      __$$FileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String directory,
      List<RawFile> rawFiles,
      bool inProgress,
      bool isError,
      int current});
}

/// @nodoc
class __$$FileStateImplCopyWithImpl<$Res>
    extends _$FileStateCopyWithImpl<$Res, _$FileStateImpl>
    implements _$$FileStateImplCopyWith<$Res> {
  __$$FileStateImplCopyWithImpl(
      _$FileStateImpl _value, $Res Function(_$FileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directory = null,
    Object? rawFiles = null,
    Object? inProgress = null,
    Object? isError = null,
    Object? current = null,
  }) {
    return _then(_$FileStateImpl(
      directory: null == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String,
      rawFiles: null == rawFiles
          ? _value.rawFiles
          : rawFiles // ignore: cast_nullable_to_non_nullable
              as List<RawFile>,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FileStateImpl implements _FileState {
  const _$FileStateImpl(
      {required this.directory,
      required this.rawFiles,
      this.inProgress = false,
      this.isError = false,
      this.current = 0});

  @override
  final String directory;
  @override
  final List<RawFile> rawFiles;
  @override
  @JsonKey()
  final bool inProgress;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final int current;

  @override
  String toString() {
    return 'FileState(directory: $directory, rawFiles: $rawFiles, inProgress: $inProgress, isError: $isError, current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileStateImpl &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            const DeepCollectionEquality().equals(other.rawFiles, rawFiles) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.current, current) || other.current == current));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      directory,
      const DeepCollectionEquality().hash(rawFiles),
      inProgress,
      isError,
      current);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileStateImplCopyWith<_$FileStateImpl> get copyWith =>
      __$$FileStateImplCopyWithImpl<_$FileStateImpl>(this, _$identity);
}

abstract class _FileState implements FileState {
  const factory _FileState(
      {required final String directory,
      required final List<RawFile> rawFiles,
      final bool inProgress,
      final bool isError,
      final int current}) = _$FileStateImpl;

  @override
  String get directory;
  @override
  List<RawFile> get rawFiles;
  @override
  bool get inProgress;
  @override
  bool get isError;
  @override
  int get current;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileStateImplCopyWith<_$FileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
