import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? height;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.height,
  });
  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,

      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
      ),
      bottom: bottom,
      leading: leading,
      actions: actions,
    );
  }
}
