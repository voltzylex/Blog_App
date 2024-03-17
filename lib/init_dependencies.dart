import 'package:blog_app/core/secrets/app_secreats.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_repositoryi_mpl.dart';
import 'package:blog_app/features/auth/domain/repository/aut_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sing_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnon);
  serviceLocator.registerLazySingleton(() => supabase.client);
}

_initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: serviceLocator<SupabaseClient>(),
    ),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator<AuthRemoteDataSourceImpl>(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      authRepository: serviceLocator<AuthRepository>(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator<UserSignUp>(),
    ),
  );
}
