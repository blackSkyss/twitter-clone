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
Stream<Tweet> getLastestTweet(GetLastestTweetRef ref) {
  final tweetRepository = ref.read(tweetRepositoryProvider);
  return tweetRepository.getLastestTweet();
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

  // Get lastest tweet
  Stream<Tweet> getLastestTweet() {
    return _tweets.orderBy('tweetedAt', descending: true).snapshots().map(
          (tweet) =>
              Tweet.fromMap(tweet.docs.first.data() as Map<String, dynamic>),
        );
  }

  // Like tweet
  Future<void> likeTweet(Tweet tweet) async {
    await _tweets.doc(tweet.id).update({
      'likes': tweet.likes,
    });
  }
}
