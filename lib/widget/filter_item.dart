import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// class FilterItem extends StatefulWidget {
//   final String title;
//   const FilterItem({required this.title, super.key});

//   @override
//   State<FilterItem> createState() => _FilterItemState();
// }

// class _FilterItemState extends State<FilterItem> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Provider.of<HomeFilterState>(context, listen: false)
//             .changeTitle(widget.title);
//       },
//       child:
//           Consumer<HomeFilterState>(builder: (context, homeFilterStae, widget) {
//         String currentTitle = homeFilterStae.currentTitle;
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: currentTitle == this.widget.title
//                   ? AppTheme.primary100
//                   : null,
//               borderRadius: BorderRadius.circular(10)),
//           child: Center(
//             child: Text(
//               this.widget.title,
//               style: AppTheme.smallRegular(
//                   color: currentTitle == this.widget.title
//                       ? Colors.white
//                       : AppTheme.primary80),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

class CustomContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  const CustomContainer(
      {super.key,
      required this.onTap,
      required this.title,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary100 : null,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: AppTheme.smallRegular(
                color: isSelected ? Colors.white : AppTheme.primary80),
          ),
        ),
      ),
    );
  }
}
