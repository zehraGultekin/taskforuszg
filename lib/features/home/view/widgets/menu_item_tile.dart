import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const MenuItemTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: double.infinity,
      child: Center(
        child: ListTile(
          onTap: onTap,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withAlpha(20),
            ),
            child: Icon(icon, color: Colors.grey),
          ),
          title: Text(title, style: TextTheme().bodyLarge),
          subtitle: Text(subtitle, style: TextTheme().bodySmall),
          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
