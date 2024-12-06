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
  String get directory => throw _privateConstructorUsedError;
  List<File> get files => throw _privateConstructorUsedError;
  List<RawFile> get rawFiles => throw _privateConstructorUsedError;
  RawFile? get currentFile => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get showSelected => throw _privateConstructorUsedError;
  int get current => throw _privateConstructorUsedError;

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
  $Res call(
      {String directory,
      List<File> files,
      List<RawFile> rawFiles,
      RawFile? currentFile,
      bool isLoading,
      bool isError,
      bool showSelected,
      int current});
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
    Object? directory = null,
    Object? files = null,
    Object? rawFiles = null,
    Object? currentFile = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? showSelected = null,
    Object? current = null,
  }) {
    return _then(_value.copyWith(
      directory: null == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      rawFiles: null == rawFiles
          ? _value.rawFiles
          : rawFiles // ignore: cast_nullable_to_non_nullable
              as List<RawFile>,
      currentFile: freezed == currentFile
          ? _value.currentFile
          : currentFile // ignore: cast_nullable_to_non_nullable
              as RawFile?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      showSelected: null == showSelected
          ? _value.showSelected
          : showSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call(
      {String directory,
      List<File> files,
      List<RawFile> rawFiles,
      RawFile? currentFile,
      bool isLoading,
      bool isError,
      bool showSelected,
      int current});
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
    Object? directory = null,
    Object? files = null,
    Object? rawFiles = null,
    Object? currentFile = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? showSelected = null,
    Object? current = null,
  }) {
    return _then(_$RawFileStateImpl(
      directory: null == directory
          ? _value.directory
          : directory // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      rawFiles: null == rawFiles
          ? _value.rawFiles
          : rawFiles // ignore: cast_nullable_to_non_nullable
              as List<RawFile>,
      currentFile: freezed == currentFile
          ? _value.currentFile
          : currentFile // ignore: cast_nullable_to_non_nullable
              as RawFile?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      showSelected: null == showSelected
          ? _value.showSelected
          : showSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RawFileStateImpl implements _RawFileState {
  const _$RawFileStateImpl(
      {required this.directory,
      required this.files,
      required this.rawFiles,
      this.currentFile = null,
      this.isLoading = false,
      this.isError = false,
      this.showSelected = true,
      this.current = 0});

  @override
  final String directory;
  @override
  final List<File> files;
  @override
  final List<RawFile> rawFiles;
  @override
  @JsonKey()
  final RawFile? currentFile;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final bool showSelected;
  @override
  @JsonKey()
  final int current;

  @override
  String toString() {
    return 'RawFileState(directory: $directory, files: $files, rawFiles: $rawFiles, currentFile: $currentFile, isLoading: $isLoading, isError: $isError, showSelected: $showSelected, current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RawFileStateImpl &&
            (identical(other.directory, directory) ||
                other.directory == directory) &&
            const DeepCollectionEquality().equals(other.files, files) &&
            const DeepCollectionEquality().equals(other.rawFiles, rawFiles) &&
            (identical(other.currentFile, currentFile) ||
                other.currentFile == currentFile) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.showSelected, showSelected) ||
                other.showSelected == showSelected) &&
            (identical(other.current, current) || other.current == current));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      directory,
      const DeepCollectionEquality().hash(files),
      const DeepCollectionEquality().hash(rawFiles),
      currentFile,
      isLoading,
      isError,
      showSelected,
      current);

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
      {required final String directory,
      required final List<File> files,
      required final List<RawFile> rawFiles,
      final RawFile? currentFile,
      final bool isLoading,
      final bool isError,
      final bool showSelected,
      final int current}) = _$RawFileStateImpl;

  @override
  String get directory;
  @override
  List<File> get files;
  @override
  List<RawFile> get rawFiles;
  @override
  RawFile? get currentFile;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get showSelected;
  @override
  int get current;

  /// Create a copy of RawFileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RawFileStateImplCopyWith<_$RawFileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
