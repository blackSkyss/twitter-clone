import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/models/notification_model.dart' as model;
import '../../../../config/themes/theme_export.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/enums/notification_type_enum.dart';

class NotificationTile extends StatelessWidget {
  final model.Notification notification;
  const NotificationTile({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: notification.notificationType == NotificationType.follow
          ? const Icon(
              Icons.person,
              color: Pallete.blueColor,
            )
          : notification.notificationType == NotificationType.like
              ? SvgPicture.asset(
                  AssetsConstants.likeFilledIcon,
                  colorFilter:
                      const ColorFilter.mode(Pallete.redColor, BlendMode.srcIn),
                  height: 20,
                )
              : notification.notificationType == NotificationType.retweet
                  ? SvgPicture.asset(
                      AssetsConstants.retweetIcon,
                      colorFilter: const ColorFilter.mode(
                          Pallete.whiteColor, BlendMode.srcIn),
                      height: 20,
                    )
                  : null,
      title: Text(notification.text),
    );
  }
}
