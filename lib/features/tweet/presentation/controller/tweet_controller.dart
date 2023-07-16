import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_clone/features/auth/presentation/controller/auth_controller.dart';
import 'package:twitter_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:twitter_clone/models/tweet_model.dart';
import 'package:twitter_clone/util/commons/functions/common_firebase.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';
import 'package:twitter_clone/util/enums/tweet_type_enum.dart';
import 'package:uuid/uuid.dart';

part 'tweet_controller.g.dart';

@riverpod
class TweetController extends _$TweetController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  // Share tweet
  Future<bool> shareTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) async {
    if (text.isEmpty) {
      showSnackBar(context: context, content: 'Please enter text');
      return false;
    }

    if (images.isNotEmpty) {
      await _shareImageTweet(images: images, text: text, context: context);
    } else {
      await _shareTextTweet(text: text, context: context);
    }

    return true;
  }

  // Share image tweet
  Future<void> _shareImageTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();
    final tweetRepository = ref.read(tweetRepositoryProvider);
    final commonFirebase = ref.read(commonFirebaseStorageRepositoryProvider);

    final hashtags = _getHashtagsFromText(text);
    String link = _getLinkFromText(text);
    final user = ref.watch(userProvider);
    final id = const Uuid().v1();

    final links = await commonFirebase.storeFileToFirebase('tweet/$id', images);

    Tweet tweet = Tweet(
      text: text,
      hashtags: hashtags,
      link: link,
      imageLinks: links,
      uid: user!.uid,
      tweetType: TweetType.image,
      tweetedAt: DateTime.now(),
      likes: [],
      commentIds: [],
      id: id,
      reshareCount: 0,
    );

    state = await AsyncValue.guard(
      () async {
        await tweetRepository.shareTweet(tweet);
      },
    );
  }

  // Share text tweet
  Future<void> _shareTextTweet({
    required String text,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();
    final tweetRepository = ref.read(tweetRepositoryProvider);
    final hashtags = _getHashtagsFromText(text);
    String link = _getLinkFromText(text);
    final user = ref.watch(userProvider);
    final id = const Uuid().v1();

    Tweet tweet = Tweet(
      text: text,
      hashtags: hashtags,
      link: link,
      imageLinks: [],
      uid: user!.uid,
      tweetType: TweetType.text,
      tweetedAt: DateTime.now(),
      likes: [],
      commentIds: [],
      id: id,
      reshareCount: 0,
    );

    state = await AsyncValue.guard(
      () async {
        await tweetRepository.shareTweet(tweet);
      },
    );
  }

  // Get link from text
  String _getLinkFromText(String text) {
    String link = '';
    List<String> wordsInSentence = text.split(' ');
    for (String word in wordsInSentence) {
      if (word.startsWith('https://') || word.startsWith('www.')) {
        link = word;
      }
    }
    return link;
  }

  // Get hashtag from text
  List<String> _getHashtagsFromText(String text) {
    List<String> hashtags = [];
    List<String> wordsInSentence = text.split(' ');
    for (String word in wordsInSentence) {
      if (word.startsWith('#')) {
        hashtags.add(word);
      }
    }
    return hashtags;
  }
}
