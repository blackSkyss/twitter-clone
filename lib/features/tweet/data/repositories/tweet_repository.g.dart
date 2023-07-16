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
String _$getTweetsHash() => r'b29d68e3ce260baacc944f2df583b9e5a8695371';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
