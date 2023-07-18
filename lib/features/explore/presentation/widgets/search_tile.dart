import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/config/routes/app_router.dart';
import 'package:twitter_clone/config/themes/theme_export.dart';
import 'package:twitter_clone/models/user_model.dart';

class SearchTile extends StatelessWidget {
  final UserModel user;
  const SearchTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.router.push(UserProfileViewRoute(user: user));
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profilePic),
        radius: 30,
      ),
      title: Text(
        user.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${user.name}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            user.bio,
            style: const TextStyle(
              color: Pallete.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
