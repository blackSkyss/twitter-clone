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
String _$getUserDataHash() => r'e0aa3842803c5f9e9e0318eb203026f7fd57c472';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetUserDataRef = AutoDisposeFutureProviderRef<UserModel>;

/// See also [getUserData].
@ProviderFor(getUserData)
const getUserDataProvider = GetUserDataFamily();

/// See also [getUserData].
class GetUserDataFamily extends Family<AsyncValue<UserModel>> {
  /// See also [getUserData].
  const GetUserDataFamily();

  /// See also [getUserData].
  GetUserDataProvider call(
    String uid,
  ) {
    return GetUserDataProvider(
      uid,
    );
  }

  @override
  GetUserDataProvider getProviderOverride(
    covariant GetUserDataProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserDataProvider';
}

/// See also [getUserData].
class GetUserDataProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [getUserData].
  GetUserDataProvider(
    this.uid,
  ) : super.internal(
          (ref) => getUserData(
            ref,
            uid,
          ),
          from: getUserDataProvider,
          name: r'getUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDataHash,
          dependencies: GetUserDataFamily._dependencies,
          allTransitiveDependencies:
              GetUserDataFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is GetUserDataProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
