import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/tweet_repository.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';
import '../widgets/tweet_card.dart';

@RoutePage()
class HashtagView extends ConsumerWidget {
  final String hashtag;
  const HashtagView({
    super.key,
    required this.hashtag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hashtag),
      ),
      // TODO: MAKE IT REALTIME
      body: ref.watch(getTweetsByHashtagProvider(hashtag)).when(
            data: (tweets) {
              if (tweets.isEmpty) {
                return const Center(
                  child: Text('No tweet to show!'),
                );
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
            loading: () => const Loader(),
          ),
    );
  }
}
