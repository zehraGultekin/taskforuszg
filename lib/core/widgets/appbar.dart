import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final Widget? leading;
  final List<Widget>? actions;



   const CustomAppBar({super.key, required this.title, required this.backgroundColor,required this.textColor, required this.height, this.leading, this.actions,});
  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,style: TextStyle(color: textColor),),
      backgroundColor: backgroundColor,
      toolbarHeight: height,
      leading: leading,
      actions: actions,);
  }
}