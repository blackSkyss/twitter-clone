import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:twitter_clone/features/tweet/presentation/controller/tweet_controller.dart';
import 'package:twitter_clone/features/tweet/presentation/widgets/tweet_card.dart';
import 'package:twitter_clone/models/tweet_model.dart';
import 'package:twitter_clone/util/extensions/extensions_export.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';

@RoutePage()
class TwitterReplyView extends ConsumerWidget {
  final Tweet tweet;
  const TwitterReplyView({
    super.key,
    required this.tweet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      tweetControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet'),
      ),
      body: Column(
        children: [
          TweetCard(tweet: tweet),
          ref.watch(getRepliesToTweetProvider(tweet.id)).when(
                data: (tweets) {
                  if (tweets.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Center(
                        child: Text('No one has replied to this tweet yet!'),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: tweets.length,
                      itemBuilder: (context, index) {
                        final tweet = tweets[index];
                        return TweetCard(
                          tweet: tweet,
                        );
                      },
                    ),
                  );
                },
                error: (err, trace) => ErrorText(error: err.toString()),
                loading: () => const Loader(),
              ),
        ],
      ),
      bottomNavigationBar: TextField(
        onSubmitted: (val) {
          ref.read(tweetControllerProvider.notifier).shareTweet(
            images: [],
            text: val,
            context: context,
            repliedTo: tweet.id,
            repliedToUserId: tweet.uid,
          );
        },
        decoration: const InputDecoration(
          hintText: 'Tweet your reply',
        ),
      ),
    );
  }
}
