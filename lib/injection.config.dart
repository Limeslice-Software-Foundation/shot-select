// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'repository/add_dir_repository.dart' as _i369;
import 'repository/lib_raw_repository.dart' as _i63;
import 'repository/raw_file_repository.dart' as _i270;
import 'service/lib_raw_service.dart' as _i681;
import 'service/raw_file_service.dart' as _i772;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i63.LibRawRepository>(() => _i63.LibRawRepository());
    gh.lazySingleton<_i270.RawFileRepository>(() => _i270.RawFileRepository());
    gh.lazySingleton<_i369.AppDirRepository>(() => _i369.AppDirRepository());
    gh.lazySingleton<_i772.RawFileService>(() => _i772.RawFileService());
    gh.lazySingleton<_i681.LibRawService>(() => _i681.LibRawService());
    return this;
  }
}
