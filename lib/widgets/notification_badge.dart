import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

import '../theme/letsgo_theme.dart';

class NotificationBadge extends StatelessWidget {
  final int totalNotifications;
  final IconData? icon;

  const NotificationBadge({
    required this.totalNotifications,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconBadge(
      icon: Icon(
        icon,
        color: LetsGoTheme.main,
        size: 30,
      ),
      itemCount: totalNotifications,
      badgeColor: Colors.red,
      itemColor: Colors.white,
      top: 5,
      hideZero: true,
      onTap: () {
        print('test');
      },
    );
  }
}
