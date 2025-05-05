import 'package:flutter/material.dart';
import '../colors/colors.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool shouldShowLeading;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.shouldShowLeading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryVariant,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: actions,
      automaticallyImplyLeading: false,
      leading: shouldShowLeading ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}