import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final Widget? title;
  final IconThemeData? iconTheme;
  
  const GlassAppBar({super.key, this.title, this.iconTheme});
  
  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: AppBar(
        title: title,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: iconTheme,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}