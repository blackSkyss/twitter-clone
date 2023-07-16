import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/config/themes/theme_export.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/tweet/presentation/widgets/carousel_image.dart';
import 'package:twitter_clone/features/tweet/presentation/widgets/hashtag_text.dart';
import 'package:twitter_clone/features/tweet/presentation/widgets/tweet_icon_button.dart';
import 'package:twitter_clone/models/tweet_model.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twitter_clone/util/constants/constants_export.dart';
import 'package:twitter_clone/util/enums/tweet_type_enum.dart';

class TweetCard extends ConsumerWidget {
  final Tweet tweet;
  const TweetCard({
    super.key,
    required this.tweet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUserDataProvider(tweet.uid)).when(
          data: (user) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePic),
                        radius: 22,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                '@${user.name}${timeago.format(tweet.tweetedAt, locale: 'en_short')}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Pallete.greyColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          // replied to
                          HashtagText(text: tweet.text),
                          if (tweet.tweetType == TweetType.image)
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: CarouselImage(tweet.imageLinks),
                            ),
                          if (tweet.link.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            AnyLinkPreview(
                              displayDirection:
                                  UIDirection.uiDirectionHorizontal,
                              link: 'https://${tweet.link}',
                              errorWidget: Container(
                                color: Colors.grey[300],
                                child: const Text('Oops!'),
                              ),
                            ),
                          ],
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TweetIconButton(
                                  pathName: AssetsConstants.viewsIcon,
                                  text: (tweet.commentIds.length +
                                          tweet.reshareCount +
                                          tweet.likes.length)
                                      .toString(),
                                  onTap: () {},
                                ),
                                TweetIconButton(
                                  pathName: AssetsConstants.commentIcon,
                                  text: tweet.commentIds.length.toString(),
                                  onTap: () {},
                                ),
                                TweetIconButton(
                                  pathName: AssetsConstants.retweetIcon,
                                  text: tweet.commentIds.length.toString(),
                                  onTap: () {},
                                ),
                                TweetIconButton(
                                  pathName: AssetsConstants.likeOutlinedIcon,
                                  text: tweet.commentIds.length.toString(),
                                  onTap: () {},
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share_outlined),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          error: (err, trace) => ErrorText(error: err.toString()),
          loading: () => const Loader(),
        );
  }
}
