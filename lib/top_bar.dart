import "package:flutter/material.dart";

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key, required AppBar appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Gym App"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 41, 45, 58),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
