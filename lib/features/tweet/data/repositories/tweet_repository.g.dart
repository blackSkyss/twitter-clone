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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
