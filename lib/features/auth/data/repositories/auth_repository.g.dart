// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'97209847c41f36b7341e80f4bee16f48979e2aa3';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$authStateHash() => r'9d081e50d765f040e9bc5424bb94d42ca6b81310';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = StreamProvider<User?>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateRef = StreamProviderRef<User?>;
String _$getUserDataHash() => r'd6b91b6dc401071bdf28d3ce4a0ec2586d971352';

/// See also [getUserData].
@ProviderFor(getUserData)
final getUserDataProvider = AutoDisposeFutureProvider<UserModel>.internal(
  getUserData,
  name: r'getUserDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getUserDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserDataRef = AutoDisposeFutureProviderRef<UserModel>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
