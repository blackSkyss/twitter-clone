// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/tweet/presentation/controller/tweet_controller.dart';
import 'package:twitter_clone/util/commons/functions/utils.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';
import 'package:twitter_clone/util/constants/assets_constants.dart';
import 'package:twitter_clone/util/extensions/extensions_export.dart';
import '../../../../config/themes/theme_export.dart';

@RoutePage()
class CreateTweetView extends HookConsumerWidget {
  const CreateTweetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getUserDataProvider(''));
    final state = ref.watch(tweetControllerProvider);
    final tweetTextController = useTextEditingController();
    final images = useState<List<File>>([]);

    ref.listen<AsyncValue>(
      tweetControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    void onPickImages() async {
      final res = await pickImages();
      if (res.isNotEmpty) {
        images.value = res;
      }
    }

    void onShareTweet() async {
      final res = await ref.read(tweetControllerProvider.notifier).shareTweet(
            images: images.value,
            text: tweetTextController.text.trim(),
            context: context,
            repliedTo: '',
          );

      if (res) {
        showSnackBar(context: context, content: 'Tweet successfully');
        context.router.pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: RoundedSmallButton(
              onTap: state.isLoading || user.isLoading ? () {} : onShareTweet,
              label: 'Tweet',
              backgroundColor: Pallete.blueColor,
              textColor: Pallete.whiteColor,
            ),
          ),
        ],
      ),
      body: state.isLoading || user.isLoading
          ? const Loader()
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(user.value!.profilePic),
                            radius: 30,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: TextField(
                              controller: tweetTextController,
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                              decoration: const InputDecoration(
                                hintText: "What's happening?",
                                hintStyle: TextStyle(
                                  color: Pallete.greyColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      if (images.value.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: CarouselSlider(
                            items: images.value.map(
                              (file) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Image.file(file),
                                );
                              },
                            ).toList(),
                            options: CarouselOptions(
                              height: 400,
                              enableInfiniteScroll: false,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Pallete.greyColor,
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: onPickImages,
                child: SvgPicture.asset(AssetsConstants.galleryIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15,
              ),
              child: SvgPicture.asset(AssetsConstants.gifIcon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15,
              ),
              child: SvgPicture.asset(AssetsConstants.emojiIcon),
            ),
          ],
        ),
      ),
    );
  }
}
