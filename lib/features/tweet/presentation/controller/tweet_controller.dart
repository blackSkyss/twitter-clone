import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../../notifications/presentation/controller/notification_controller.dart';
import '../../data/repositories/tweet_repository.dart';
import '../../../../models/tweet_model.dart';
import '../../../../util/commons/functions/common_firebase.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';
import '../../../../util/enums/notification_type_enum.dart';
import '../../../../util/enums/tweet_type_enum.dart';
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
    required String repliedTo,
    required String repliedToUserId,
  }) async {
    if (text.isEmpty) {
      showSnackBar(context: context, content: 'Please enter text');
      return false;
    }

    if (images.isNotEmpty) {
      await _shareImageTweet(
        images: images,
        text: text,
        repliedTo: repliedTo,
        repliedToUserId: repliedToUserId,
      );
    } else {
      await _shareTextTweet(
        text: text,
        repliedTo: repliedTo,
        repliedToUserId: repliedToUserId,
      );
    }

    return true;
  }

  // Share image tweet
  Future<void> _shareImageTweet({
    required List<File> images,
    required String text,
    required String repliedTo,
    required String repliedToUserId,
  }) async {
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    final tweetRepository = ref.read(tweetRepositoryProvider);
    final commonFirebase = ref.read(commonFirebaseStorageRepositoryProvider);
    final notificationController =
        ref.read(notificationControllerProvider.notifier);

    final hashtags = _getHashtagsFromText(text);
    String link = _getLinkFromText(text);
    final user = await authRepository.getUserData('');
    final id = const Uuid().v1();

    final links = await commonFirebase.storeFileToFirebase('tweet/$id', images);

    Tweet tweet = Tweet(
      text: text,
      hashtags: hashtags,
      link: link,
      imageLinks: links,
      uid: user.uid,
      tweetType: TweetType.image,
      tweetedAt: DateTime.now(),
      likes: [],
      commentIds: [],
      id: id,
      reshareCount: 0,
      retweetedBy: '',
      repliedTo: repliedTo,
    );

    state = await AsyncValue.guard(
      () async {
        await tweetRepository.shareTweet(tweet);

        if (repliedToUserId.isNotEmpty) {
          notificationController.createNotification(
            text: '${user.name} replied to your tweet!',
            postId: tweet.id,
            notificationType: NotificationType.reply,
            uid: repliedToUserId,
          );
        }
      },
    );
  }

  // Share text tweet
  Future<void> _shareTextTweet({
    required String repliedTo,
    required String text,
    required String repliedToUserId,
  }) async {
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    final tweetRepository = ref.read(tweetRepositoryProvider);
    final notificationController =
        ref.read(notificationControllerProvider.notifier);

    final user = await authRepository.getUserData('');
    final id = const Uuid().v1();
    final hashtags = _getHashtagsFromText(text);
    String link = _getLinkFromText(text);

    Tweet tweet = Tweet(
      text: text,
      hashtags: hashtags,
      link: link,
      imageLinks: [],
      uid: user.uid,
      tweetType: TweetType.text,
      tweetedAt: DateTime.now(),
      likes: [],
      commentIds: [],
      id: id,
      reshareCount: 0,
      retweetedBy: '',
      repliedTo: repliedTo,
    );

    state = await AsyncValue.guard(
      () async {
        await tweetRepository.shareTweet(tweet);

        if (repliedToUserId.isNotEmpty) {
          notificationController.createNotification(
            text: '${user.name} replied to your tweet!',
            postId: tweet.id,
            notificationType: NotificationType.reply,
            uid: repliedToUserId,
          );
        }
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

  // Like tweet
  void likeTweet(Tweet tweet) async {
    final authRepository = ref.read(authRepositoryProvider);
    final tweetRepository = ref.read(tweetRepositoryProvider);
    final notificationController =
        ref.read(notificationControllerProvider.notifier);

    final user = await authRepository.getUserData('');
    List<String> likes = tweet.likes;

    if (tweet.likes.contains(user.uid)) {
      likes.remove(user.uid);
    } else {
      likes.add(user.uid);
    }

    tweet = tweet.copyWith(likes: likes);
    state = await AsyncValue.guard(
      () async {
        await tweetRepository.likeTweet(tweet);
        notificationController.createNotification(
          text: '${user.name} like your tweet!',
          postId: tweet.id,
          notificationType: NotificationType.like,
          uid: tweet.uid,
        );
      },
    );
  }

  // Reshare tweet
  Future<void> reshareTweet(Tweet tweet) async {
    final authRepository = ref.read(authRepositoryProvider);
    final tweetRepository = ref.read(tweetRepositoryProvider);
    final notificationController =
        ref.read(notificationControllerProvider.notifier);

    final user = await authRepository.getUserData('');
    tweet = tweet.copyWith(
      reshareCount: tweet.reshareCount + 1,
    );

    state = await AsyncValue.guard(
      () async {
        await tweetRepository.updateReshareCount(tweet);

        tweet = tweet.copyWith(
          id: const Uuid().v1(),
          likes: [],
          commentIds: [],
          reshareCount: 0,
          tweetedAt: DateTime.now(),
          retweetedBy: user.name,
        );

        await tweetRepository.shareTweet(tweet);

        notificationController.createNotification(
          text: '${user.name} reshared your tweet!',
          postId: tweet.id,
          notificationType: NotificationType.retweet,
          uid: tweet.uid,
        );
      },
    );
  }
}
