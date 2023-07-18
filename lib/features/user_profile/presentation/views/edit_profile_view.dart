import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/user_profile/presentation/controller/user_profile_controller.dart';
import 'package:twitter_clone/util/commons/functions/utils.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';
import 'package:twitter_clone/util/extensions/extensions_export.dart';
import '../../../../config/themes/theme_export.dart';
import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class EditProfileView extends HookConsumerWidget {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getLastestUserProfileDataProvider('')).when(
          data: (user) {
            //  final user = ref.watch(getUserDataProvider('')).value;
            final nameController = useTextEditingController(
              text: user!.name,
            );
            final bioController = useTextEditingController(
              text: user.bio,
            );
            final bannerFile = useState<File?>(null);
            final profileFile = useState<File?>(null);
            final state = ref.watch(userProfileControllerProvider);

            ref.listen<AsyncValue>(
              userProfileControllerProvider,
              (_, state) => state.showAlertDialogOnError(context),
            );

            void selectBannerImage() async {
              final banner = await pickImage();
              if (banner != null) {
                bannerFile.value = banner;
              }
            }

            void selectProfileImage() async {
              final profile = await pickImage();
              if (profile != null) {
                profileFile.value = profile;
              }
            }

            void saveInformation() async {
              await ref
                  .read(userProfileControllerProvider.notifier)
                  .updateUserData(
                    userModel: user.copyWith(
                      name: nameController.text.trim(),
                      bio: bioController.text.trim(),
                    ),
                    bannerFile: bannerFile.value,
                    profileFile: profileFile.value,
                  );

              if (context.mounted) {
                showSnackBar(
                  context: context,
                  content: 'Update information successfully',
                );

                context.router.pop();
              }
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text('Edit Profile'),
                centerTitle: false,
                actions: [
                  TextButton(
                    onPressed: saveInformation,
                    child: const Text('Save'),
                  ),
                ],
              ),
              body: state.isLoading
                  ? const Loader()
                  : Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: selectBannerImage,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: bannerFile.value != null
                                      ? Image.file(
                                          bannerFile.value!,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : user.bannerPic.isEmpty
                                          ? Container(
                                              color: Pallete.blueColor,
                                            )
                                          : Image.network(
                                              user.bannerPic,
                                              fit: BoxFit.fitWidth,
                                            ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: GestureDetector(
                                  onTap: selectProfileImage,
                                  child: profileFile.value != null
                                      ? CircleAvatar(
                                          backgroundImage:
                                              FileImage(profileFile.value!),
                                          radius: 40,
                                        )
                                      : CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(user.profilePic),
                                          radius: 40,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            contentPadding: EdgeInsets.all(18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: bioController,
                          decoration: const InputDecoration(
                            hintText: 'Bio',
                            contentPadding: EdgeInsets.all(18),
                          ),
                          maxLines: 4,
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
