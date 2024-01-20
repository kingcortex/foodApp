import 'package:flutter/material.dart';
import 'item.dart';


// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  final PageController pageController;
  void Function(int, PageController)? onTap;
  CustomBottomBar({
    required this.pageController,
    this.onTap,
    super.key
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: (MediaQuery.of(context).padding.bottom) + 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Item(
              controller: widget.pageController,
              onTap: widget.onTap,
              index: 0,
              unselectedIconPath: "assets/icons/home-1.svg",
              selectedIconPath: "assets/icons/home-2.svg",
            ),
            Item(
              controller: widget.pageController,
              onTap: widget.onTap,
              index: 1,
              unselectedIconPath: "assets/icons/fav-1.svg",
              selectedIconPath: "assets/icons/fav-2.svg",
            ),
            const SizedBox(),
            Item(
              controller: widget.pageController,
              onTap: widget.onTap,
              index: 2,
              unselectedIconPath: "assets/icons/not-1.svg",
              selectedIconPath: "assets/icons/not-2.svg",
            ),
            Item(
              controller: widget.pageController,
              onTap: widget.onTap,
              index: 3,
              unselectedIconPath: "assets/icons/acc-1.svg",
              selectedIconPath: "assets/icons/acc-2.svg",
            ),
          ],
        ),
      )
    );
  }
}
