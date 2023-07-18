// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tweetRepositoryHash() => r'154319b5ea480e92bca8f20b38e46958b22e2601';

/// See also [tweetRepository].
@ProviderFor(tweetRepository)
final tweetRepositoryProvider = Provider<TweetRepository>.internal(
  tweetRepository,
  name: r'tweetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tweetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TweetRepositoryRef = ProviderRef<TweetRepository>;
String _$getTweetsHash() => r'1112272aa62e5ac258f64d913b8265a1cff236bb';

/// See also [getTweets].
@ProviderFor(getTweets)
final getTweetsProvider = AutoDisposeFutureProvider<List<Tweet>>.internal(
  getTweets,
  name: r'getTweetsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTweetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTweetsRef = AutoDisposeFutureProviderRef<List<Tweet>>;
String _$getTweetByIdHash() => r'e968d6851a71ed8ee2841b308a581899e0d19be7';

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

typedef GetTweetByIdRef = AutoDisposeFutureProviderRef<Tweet>;

/// See also [getTweetById].
@ProviderFor(getTweetById)
const getTweetByIdProvider = GetTweetByIdFamily();

/// See also [getTweetById].
class GetTweetByIdFamily extends Family<AsyncValue<Tweet>> {
  /// See also [getTweetById].
  const GetTweetByIdFamily();

  /// See also [getTweetById].
  GetTweetByIdProvider call(
    String tweetId,
  ) {
    return GetTweetByIdProvider(
      tweetId,
    );
  }

  @override
  GetTweetByIdProvider getProviderOverride(
    covariant GetTweetByIdProvider provider,
  ) {
    return call(
      provider.tweetId,
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
  String? get name => r'getTweetByIdProvider';
}

/// See also [getTweetById].
class GetTweetByIdProvider extends AutoDisposeFutureProvider<Tweet> {
  /// See also [getTweetById].
  GetTweetByIdProvider(
    this.tweetId,
  ) : super.internal(
          (ref) => getTweetById(
            ref,
            tweetId,
          ),
          from: getTweetByIdProvider,
          name: r'getTweetByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTweetByIdHash,
          dependencies: GetTweetByIdFamily._dependencies,
          allTransitiveDependencies:
              GetTweetByIdFamily._allTransitiveDependencies,
        );

  final String tweetId;

  @override
  bool operator ==(Object other) {
    return other is GetTweetByIdProvider && other.tweetId == tweetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tweetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getUserTweetHash() => r'52d9b835fa2c2f0f3d5ac2fe7f848f8bd31eb0f3';
typedef GetUserTweetRef = AutoDisposeFutureProviderRef<List<Tweet>>;

/// See also [getUserTweet].
@ProviderFor(getUserTweet)
const getUserTweetProvider = GetUserTweetFamily();

/// See also [getUserTweet].
class GetUserTweetFamily extends Family<AsyncValue<List<Tweet>>> {
  /// See also [getUserTweet].
  const GetUserTweetFamily();

  /// See also [getUserTweet].
  GetUserTweetProvider call(
    String userId,
  ) {
    return GetUserTweetProvider(
      userId,
    );
  }

  @override
  GetUserTweetProvider getProviderOverride(
    covariant GetUserTweetProvider provider,
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
  String? get name => r'getUserTweetProvider';
}

/// See also [getUserTweet].
class GetUserTweetProvider extends AutoDisposeFutureProvider<List<Tweet>> {
  /// See also [getUserTweet].
  GetUserTweetProvider(
    this.userId,
  ) : super.internal(
          (ref) => getUserTweet(
            ref,
            userId,
          ),
          from: getUserTweetProvider,
          name: r'getUserTweetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserTweetHash,
          dependencies: GetUserTweetFamily._dependencies,
          allTransitiveDependencies:
              GetUserTweetFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is GetUserTweetProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getTweetsByHashtagHash() =>
    r'ef8c652b858736b77730ea14a74459d8971467f6';
typedef GetTweetsByHashtagRef = AutoDisposeFutureProviderRef<List<Tweet>>;

/// See also [getTweetsByHashtag].
@ProviderFor(getTweetsByHashtag)
const getTweetsByHashtagProvider = GetTweetsByHashtagFamily();

/// See also [getTweetsByHashtag].
class GetTweetsByHashtagFamily extends Family<AsyncValue<List<Tweet>>> {
  /// See also [getTweetsByHashtag].
  const GetTweetsByHashtagFamily();

  /// See also [getTweetsByHashtag].
  GetTweetsByHashtagProvider call(
    String hashTag,
  ) {
    return GetTweetsByHashtagProvider(
      hashTag,
    );
  }

  @override
  GetTweetsByHashtagProvider getProviderOverride(
    covariant GetTweetsByHashtagProvider provider,
  ) {
    return call(
      provider.hashTag,
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
  String? get name => r'getTweetsByHashtagProvider';
}

/// See also [getTweetsByHashtag].
class GetTweetsByHashtagProvider
    extends AutoDisposeFutureProvider<List<Tweet>> {
  /// See also [getTweetsByHashtag].
  GetTweetsByHashtagProvider(
    this.hashTag,
  ) : super.internal(
          (ref) => getTweetsByHashtag(
            ref,
            hashTag,
          ),
          from: getTweetsByHashtagProvider,
          name: r'getTweetsByHashtagProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTweetsByHashtagHash,
          dependencies: GetTweetsByHashtagFamily._dependencies,
          allTransitiveDependencies:
              GetTweetsByHashtagFamily._allTransitiveDependencies,
        );

  final String hashTag;

  @override
  bool operator ==(Object other) {
    return other is GetTweetsByHashtagProvider && other.hashTag == hashTag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hashTag.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getLastestTweetHash() => r'323ff5a9391c607e86cabd31204b1d1e84fa5def';

/// See also [getLastestTweet].
@ProviderFor(getLastestTweet)
final getLastestTweetProvider = AutoDisposeStreamProvider<List<Tweet>>.internal(
  getLastestTweet,
  name: r'getLastestTweetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getLastestTweetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLastestTweetRef = AutoDisposeStreamProviderRef<List<Tweet>>;
String _$getRepliesToTweetHash() => r'cb2e14f18d3f94b3de9dbcb88f13915e735a1395';
typedef GetRepliesToTweetRef = AutoDisposeStreamProviderRef<List<Tweet>>;

/// See also [getRepliesToTweet].
@ProviderFor(getRepliesToTweet)
const getRepliesToTweetProvider = GetRepliesToTweetFamily();

/// See also [getRepliesToTweet].
class GetRepliesToTweetFamily extends Family<AsyncValue<List<Tweet>>> {
  /// See also [getRepliesToTweet].
  const GetRepliesToTweetFamily();

  /// See also [getRepliesToTweet].
  GetRepliesToTweetProvider call(
    String tweetId,
  ) {
    return GetRepliesToTweetProvider(
      tweetId,
    );
  }

  @override
  GetRepliesToTweetProvider getProviderOverride(
    covariant GetRepliesToTweetProvider provider,
  ) {
    return call(
      provider.tweetId,
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
  String? get name => r'getRepliesToTweetProvider';
}

/// See also [getRepliesToTweet].
class GetRepliesToTweetProvider extends AutoDisposeStreamProvider<List<Tweet>> {
  /// See also [getRepliesToTweet].
  GetRepliesToTweetProvider(
    this.tweetId,
  ) : super.internal(
          (ref) => getRepliesToTweet(
            ref,
            tweetId,
          ),
          from: getRepliesToTweetProvider,
          name: r'getRepliesToTweetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRepliesToTweetHash,
          dependencies: GetRepliesToTweetFamily._dependencies,
          allTransitiveDependencies:
              GetRepliesToTweetFamily._allTransitiveDependencies,
        );

  final String tweetId;

  @override
  bool operator ==(Object other) {
    return other is GetRepliesToTweetProvider && other.tweetId == tweetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tweetId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
