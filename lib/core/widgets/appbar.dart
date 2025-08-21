import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? leading;
  final double? height; 

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading != null && leading!.isNotEmpty
          ? Row(
              children: leading!,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
