import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/config/routes/app_router.dart';
import 'package:twitter_clone/features/home/presentation/widgets/side_draw.dart';
import '../../../../config/themes/theme_export.dart';
import '../../../../util/constants/constants_export.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  void navigateToCreateTweet(BuildContext context) {
    context.router.push(const CreateTweetViewRoute());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        FeedViewRoute(),
        ExploreViewRoute(),
        NotificationViewRoute(),
      ],
      drawer: const SideDrawer(),
      floatingActionButtonBuilder: (_, __) => FloatingActionButton(
        onPressed: () => navigateToCreateTweet(context),
        child: const Icon(Icons.add),
      ),
      appBarBuilder: (_, tabsRouter) => UIConstants.appBar(),
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                tabsRouter.activeIndex == 0
                    ? AssetsConstants.homeFilledIcon
                    : AssetsConstants.homeOutlinedIcon,
                colorFilter: const ColorFilter.mode(
                  Pallete.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.searchIcon,
                colorFilter: const ColorFilter.mode(
                  Pallete.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                tabsRouter.activeIndex == 2
                    ? AssetsConstants.notifFilledIcon
                    : AssetsConstants.notifOutlinedIcon,
                colorFilter: const ColorFilter.mode(
                  Pallete.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
