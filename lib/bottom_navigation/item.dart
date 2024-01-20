import 'package:app_cooking/bottom_navigation/botom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  final int index;
  final PageController controller;
  final String unselectedIconPath;
  final String selectedIconPath;
  final void Function(int, PageController)? onTap;

  const Item({
    required this.controller,
    required this.index,
    required this.unselectedIconPath,
    required this.selectedIconPath,
    this.onTap,
    super.key
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!(widget.index, widget.controller);
      },
      child: Container(
        width: 40,
        height: 40,
        color: Colors.white,
        child: Center(
          child: Consumer<BottomNAvigationState>(
            builder: (context, state, _) {
              return SvgPicture.asset(
              state.currentIndex == widget.index?
              widget.selectedIconPath : widget.unselectedIconPath,
              height: 24,
              width: 24,
            );
          }
          )
        ),
      ),
    );
  }
}