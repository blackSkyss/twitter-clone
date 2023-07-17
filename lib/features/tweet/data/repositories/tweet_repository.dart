import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:twitter_clone/models/tweet_model.dart';
import '../../../../util/constants/constants_export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../util/providers/firebase_providers.dart';

part 'tweet_repository.g.dart';

@Riverpod(keepAlive: true)
TweetRepository tweetRepository(TweetRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  final storage = ref.read(storageProvider);
  return TweetRepository(
    firestore: firestore,
    storage: storage,
  );
}

@riverpod
Future<List<Tweet>> getTweets(GetTweetsRef ref) {
  final tweetRepository = ref.read(tweetRepositoryProvider);
  return tweetRepository.getTweets();
}

@riverpod
Future<Tweet> getTweetById(GetTweetByIdRef ref, String tweetId) {
  final tweetRepository = ref.read(tweetRepositoryProvider);
  return tweetRepository.getTweetById(tweetId);
}

@riverpod
Future<List<Tweet>> getUserTweet(GetUserTweetRef ref, String userId) {
  final tweetRepository = ref.read(tweetRepositoryProvider);
  return tweetRepository.getUserTweet(userId);
}

@riverpod
Stream<List<Tweet>> getLastestTweet(GetLastestTweetRef ref) {
  final tweetRepository = ref.read(tweetRepositoryProvider);
  return tweetRepository.getLastestTweet();
}

@riverpod
Stream<List<Tweet>> getRepliesToTweet(
  GetRepliesToTweetRef ref,
  String tweetId,
) {
  final tweetRepository = ref.read(tweetRepositoryProvider);
  return tweetRepository.getRepliesToTweet(tweetId);
}

class TweetRepository {
  final FirebaseFirestore _firestore;
  // ignore: unused_field
  final FirebaseStorage _storage;
  TweetRepository({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _storage = storage;

  CollectionReference get _tweets =>
      _firestore.collection(FirebaseConstants.tweetsCollection);

  // Share text tweet
  Future<void> shareTweet(Tweet tweet) async {
    await _tweets.doc(tweet.id).set(tweet.toMap());
  }

  // Get list tweet
  Future<List<Tweet>> getTweets() async {
    List<Tweet> tweets = [];
    await _tweets.orderBy('tweetedAt', descending: true).get().then((snapshot) {
      for (var doc in snapshot.docs) {
        tweets.add(Tweet.fromMap(doc.data() as Map<String, dynamic>));
      }
    });

    return tweets;
  }

  // Get tweet by id
  Future<Tweet> getTweetById(String tweetId) async {
    final snapshot = await _tweets.doc(tweetId).get();
    return Tweet.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  // Get user tweet
  Future<List<Tweet>> getUserTweet(String userId) async {
    List<Tweet> tweets = [];
    final snapshot = await _tweets.where('uid', isEqualTo: userId).get();
    for (var document in snapshot.docs) {
      tweets.add(Tweet.fromMap(document.data() as Map<String, dynamic>));
    }

    return tweets;
  }

  // Like tweet
  Future<void> likeTweet(Tweet tweet) async {
    await _tweets.doc(tweet.id).update({
      'likes': tweet.likes,
    });
  }

  // Update reshare count
  Future<void> updateReshareCount(Tweet tweet) async {
    await _tweets.doc(tweet.id).update({
      'reshareCount': tweet.reshareCount,
    });
  }

  // Get lastest tweet
  Stream<List<Tweet>> getLastestTweet() {
    return _tweets
        .orderBy('tweetedAt', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((event) {
      List<Tweet> tweets = [];
      for (var document in event.docs) {
        tweets.add(Tweet.fromMap(document.data() as Map<String, dynamic>));
      }
      return tweets;
    });
  }

  // Get replies to tweet
  Stream<List<Tweet>> getRepliesToTweet(String tweetId) {
    return _tweets
        .where('repliedTo', isEqualTo: tweetId)
        .orderBy('tweetedAt', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((event) {
      List<Tweet> tweets = [];
      for (var document in event.docs) {
        tweets.add(Tweet.fromMap(document.data() as Map<String, dynamic>));
      }
      return tweets;
    });
  }
}
