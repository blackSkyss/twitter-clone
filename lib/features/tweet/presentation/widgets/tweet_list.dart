import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:twitter_clone/features/tweet/presentation/widgets/tweet_card.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';

class TweetList extends ConsumerWidget {
  const TweetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetsProvider).when(
          data: (tweets) {
            return ref.watch(getLastestTweetProvider).when(
                  data: (data) {
                    if (!tweets.contains(data)) {
                      tweets.insert(0, data);
                    }

                    return ListView.builder(
                      itemCount: tweets.length,
                      itemBuilder: (context, index) {
                        final tweet = tweets[index];
                        return TweetCard(
                          tweet: tweet,
                        );
                      },
                    );
                  },
                  error: (err, trace) => ErrorText(error: err.toString()),
                  loading: () {
                    return ListView.builder(
                      itemCount: tweets.length,
                      itemBuilder: (context, index) {
                        final tweet = tweets[index];
                        return TweetCard(
                          tweet: tweet,
                        );
                      },
                    );
                  },
                );
          },
          error: (err, trace) => ErrorText(error: err.toString()),
          loading: () => const Loader(),
        );
  }
}
