import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/routes/app_router.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../../tweet/data/repositories/tweet_repository.dart';
import '../controller/user_profile_controller.dart';
import 'follow_count.dart';
import '../../../../models/user_model.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';
import '../../../../config/themes/theme_export.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../tweet/presentation/widgets/tweet_card.dart';

class UserProfile extends ConsumerWidget {
  final UserModel user;
  const UserProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(getUserDataProvider('')).value;

    return currentUser == null
        ? const Loader()
        : NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 150,
                  floating: true,
                  snap: true,
                  flexibleSpace: Stack(
                    children: [
                      Positioned.fill(
                        child: user.bannerPic.isEmpty
                            ? Container(
                                color: Pallete.blueColor,
                              )
                            : Image.network(
                                user.bannerPic,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.profilePic),
                          radius: 45,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.all(20),
                        child: OutlinedButton(
                          onPressed: () {
                            if (currentUser.uid == user.uid) {
                              // Edit profile
                              context.router.push(const EditProfileViewRoute());
                            } else {
                              // Follow / Unfollow
                              ref
                                  .read(userProfileControllerProvider.notifier)
                                  .followUser(
                                    user: user,
                                    currentUser: currentUser,
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                color: Pallete.whiteColor,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                          ),
                          child: Text(
                            currentUser.uid == user.uid
                                ? 'Edit Profile'
                                : currentUser.following.contains(user.uid)
                                    ? 'Unfollow'
                                    : 'Follow',
                            style: const TextStyle(
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (user.isTwitterBlue)
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: SvgPicture.asset(
                                  AssetsConstants.verifiedIcon,
                                ),
                              ),
                          ],
                        ),
                        Text(
                          '@${user.name}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Pallete.greyColor,
                          ),
                        ),
                        Text(
                          user.bio,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            FollowCount(
                              count: user.following.length,
                              text: 'Following',
                            ),
                            const SizedBox(width: 15),
                            FollowCount(
                              count: user.followers.length,
                              text: 'Followers',
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Divider(color: Pallete.whiteColor),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: ref.watch(getUserTweetProvider(user.uid)).when(
                  data: (tweets) {
                    if (tweets.isEmpty) {
                      return const Center(
                        child: Text("This user hasn't tweeted yet"),
                      );
                    }

                    //TODO: MAKE IT REALTIME
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
