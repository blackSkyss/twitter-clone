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
String _$getLastestUserProfileDataHash() =>
    r'aac6e94749dfb0e02752a82908d9d78776b51607';

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

typedef GetLastestUserProfileDataRef = AutoDisposeStreamProviderRef<UserModel?>;

/// See also [getLastestUserProfileData].
@ProviderFor(getLastestUserProfileData)
const getLastestUserProfileDataProvider = GetLastestUserProfileDataFamily();

/// See also [getLastestUserProfileData].
class GetLastestUserProfileDataFamily extends Family<AsyncValue<UserModel?>> {
  /// See also [getLastestUserProfileData].
  const GetLastestUserProfileDataFamily();

  /// See also [getLastestUserProfileData].
  GetLastestUserProfileDataProvider call(
    String uid,
  ) {
    return GetLastestUserProfileDataProvider(
      uid,
    );
  }

  @override
  GetLastestUserProfileDataProvider getProviderOverride(
    covariant GetLastestUserProfileDataProvider provider,
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
  String? get name => r'getLastestUserProfileDataProvider';
}

/// See also [getLastestUserProfileData].
class GetLastestUserProfileDataProvider
    extends AutoDisposeStreamProvider<UserModel?> {
  /// See also [getLastestUserProfileData].
  GetLastestUserProfileDataProvider(
    this.uid,
  ) : super.internal(
          (ref) => getLastestUserProfileData(
            ref,
            uid,
          ),
          from: getLastestUserProfileDataProvider,
          name: r'getLastestUserProfileDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLastestUserProfileDataHash,
          dependencies: GetLastestUserProfileDataFamily._dependencies,
          allTransitiveDependencies:
              GetLastestUserProfileDataFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is GetLastestUserProfileDataProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getUserDataHash() => r'4b5b24e967f5368ee58a77f56f5c8b354100bc89';
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
    String userId,
  ) {
    return GetUserDataProvider(
      userId,
    );
  }

  @override
  GetUserDataProvider getProviderOverride(
    covariant GetUserDataProvider provider,
  ) {
    return call(
      provider.userId,
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
    this.userId,
  ) : super.internal(
          (ref) => getUserData(
            ref,
            userId,
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

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is GetUserDataProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$searchUserByNameHash() => r'0cffe228d112a2a12bf496927515fdb6fd25f0ae';
typedef SearchUserByNameRef = AutoDisposeFutureProviderRef<List<UserModel>>;

/// See also [searchUserByName].
@ProviderFor(searchUserByName)
const searchUserByNameProvider = SearchUserByNameFamily();

/// See also [searchUserByName].
class SearchUserByNameFamily extends Family<AsyncValue<List<UserModel>>> {
  /// See also [searchUserByName].
  const SearchUserByNameFamily();

  /// See also [searchUserByName].
  SearchUserByNameProvider call(
    String name,
  ) {
    return SearchUserByNameProvider(
      name,
    );
  }

  @override
  SearchUserByNameProvider getProviderOverride(
    covariant SearchUserByNameProvider provider,
  ) {
    return call(
      provider.name,
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
  String? get name => r'searchUserByNameProvider';
}

/// See also [searchUserByName].
class SearchUserByNameProvider
    extends AutoDisposeFutureProvider<List<UserModel>> {
  /// See also [searchUserByName].
  SearchUserByNameProvider(
    this.name,
  ) : super.internal(
          (ref) => searchUserByName(
            ref,
            name,
          ),
          from: searchUserByNameProvider,
          name: r'searchUserByNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchUserByNameHash,
          dependencies: SearchUserByNameFamily._dependencies,
          allTransitiveDependencies:
              SearchUserByNameFamily._allTransitiveDependencies,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is SearchUserByNameProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
