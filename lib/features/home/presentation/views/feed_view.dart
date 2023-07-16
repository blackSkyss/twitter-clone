import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:twitter_clone/features/tweet/presentation/widgets/tweet_list.dart';

@RoutePage()
class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TweetList(),
    );
  }
}
