import 'package:any_link_preview/any_link_preview.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:twitter_clone/config/routes/app_router.dart';
import 'package:twitter_clone/config/themes/theme_export.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:twitter_clone/features/tweet/presentation/controller/tweet_controller.dart';
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
    final currentUser = ref.watch(getUserDataProvider('')).value;

    void reshareTweet() async {
      await ref.read(tweetControllerProvider.notifier).reshareTweet(tweet);
      // ignore: use_build_context_synchronously
      showSnackBar(context: context, content: 'Retweeted!');
    }

    return currentUser == null
        ? const SizedBox()
        : ref.watch(getUserDataProvider(tweet.uid)).when(
              data: (user) {
                return GestureDetector(
                  onTap: () {
                    context.pushRoute(TwitterReplyViewRoute(tweet: tweet));
                  },
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                context.router
                                    .push(UserProfileViewRoute(user: user));
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.profilePic),
                                radius: 22,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (tweet.retweetedBy.isNotEmpty)
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetsConstants.retweetIcon,
                                        colorFilter: const ColorFilter.mode(
                                          Pallete.greyColor,
                                          BlendMode.srcIn,
                                        ),
                                        height: 20,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${tweet.retweetedBy} retweeted',
                                        style: const TextStyle(
                                          color: Pallete.greyColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                      '@${user.name}  ${timeago.format(tweet.tweetedAt, locale: 'en_short')}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Pallete.greyColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                // replied to
                                if (tweet.repliedTo.isNotEmpty)
                                  ref
                                      .watch(
                                          getTweetByIdProvider(tweet.repliedTo))
                                      .when(
                                        data: (repliedToTweet) {
                                          final replyingToUser = ref
                                              .watch(getUserDataProvider(
                                                  repliedToTweet.uid))
                                              .value;
                                          return RichText(
                                            text: TextSpan(
                                              text: 'Replying to',
                                              style: const TextStyle(
                                                color: Pallete.greyColor,
                                                fontSize: 16,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      ' @${replyingToUser!.name}',
                                                  style: const TextStyle(
                                                    color: Pallete.blueColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        error: (err, trace) =>
                                            ErrorText(error: err.toString()),
                                        loading: () => const Loader(),
                                      ),

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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        text:
                                            tweet.commentIds.length.toString(),
                                        onTap: () {},
                                      ),
                                      TweetIconButton(
                                        pathName: AssetsConstants.retweetIcon,
                                        text:
                                            tweet.commentIds.length.toString(),
                                        onTap: reshareTweet,
                                      ),
                                      LikeButton(
                                        onTap: (isLiked) async {
                                          ref
                                              .read(tweetControllerProvider
                                                  .notifier)
                                              .likeTweet(tweet);
                                          return !isLiked;
                                        },
                                        size: 25,
                                        isLiked: tweet.likes
                                            .contains(currentUser.uid),
                                        likeBuilder: (isLiked) {
                                          return isLiked
                                              ? SvgPicture.asset(
                                                  AssetsConstants
                                                      .likeFilledIcon,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                    Pallete.redColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                )
                                              : SvgPicture.asset(
                                                  AssetsConstants
                                                      .likeOutlinedIcon,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                    Pallete.greyColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                );
                                        },
                                        likeCount: tweet.likes.length,
                                        countBuilder:
                                            (likeCount, isLiked, text) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.0),
                                            child: Text(
                                              text,
                                              style: TextStyle(
                                                color: isLiked
                                                    ? Pallete.redColor
                                                    : Pallete.whiteColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.share_outlined,
                                          size: 25,
                                          color: Pallete.greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Pallete.greyColor,
                      ),
                    ],
                  ),
                );
              },
              error: (err, trace) => ErrorText(error: err.toString()),
              loading: () => const Loader(),
            );
  }
}
