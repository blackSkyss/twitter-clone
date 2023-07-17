import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/explore/presentation/widgets/search_tile.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';

import '../../../../config/themes/theme_export.dart';

@RoutePage()
class ExploreView extends HookConsumerWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    useListenable(searchController);

    final appbarTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Pallete.searchBarColor,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 50,
            child: TextField(
              controller: searchController,
              onSubmitted: (value) => searchController.text = value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10).copyWith(
                  left: 20,
                ),
                fillColor: Pallete.searchBarColor,
                filled: true,
                enabledBorder: appbarTextFieldBorder,
                focusedBorder: appbarTextFieldBorder,
                hintText: 'Search Twitter',
              ),
            ),
          ),
        ),
        body: ref.watch(searchUserByNameProvider(searchController.text)).when(
              data: (users) {
                if (users.isEmpty) {
                  return const Center(
                    child: Text('No thing'),
                  );
                }
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return SearchTile(user: user);
                  },
                );
              },
              error: (err, trace) => ErrorText(error: err.toString()),
              loading: () => const Loader(),
            ),
      ),
    );
  }
}
