import 'package:chat/views/all_chats_view.dart';
import 'package:chat/views/users_view.dart';
import 'package:chat/widgets/nav_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

final navigationProvider = StateProvider<int>((ref) => 0);

class HomeNavigation extends ConsumerWidget {
  HomeNavigation({super.key});

  final iconList = <IconData>[Icons.people, Icons.chat];
  final iconText = <String>[
    "Users",
    "Chat",
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorState = ref.watch(navigationProvider);

    var toggleNavigator = ref.watch(navigationProvider.notifier);

    Future<bool> onBackPressed() {
      return Future.delayed(const Duration(seconds: 2));
    }

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: NavCardWidget(
                title: iconText[index],
                icon: iconList[index],
                isActive: isActive,
              ),
            );
          },
          activeIndex: navigatorState,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.sharpEdge,
          onTap: (value) {
            toggleNavigator.state = value;
          },
        ),
        body: [
          const UsersView(),
          const AllChatView(),
        ][navigatorState],
      ),
    );
  }
}
