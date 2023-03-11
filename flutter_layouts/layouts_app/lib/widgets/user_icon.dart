import 'package:flutter/material.dart';

import '../models/user.dart';

class UserIcon extends StatelessWidget {
  bool seen;
  final User user;
  final double height;
  final double width;

  UserIcon({super.key, required this.user, bool? seen, required this.height, required this.width})
      : seen = seen ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: seen ? Colors.white : null,
        border: seen
            ? Border.all(
                width: 1,
                color: Colors.grey,
              )
            : null,
        gradient: seen
            ? null
            : const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Color.fromARGB(255, 113, 0, 47),
                  Color.fromARGB(255, 192, 27, 52),
                  Color.fromARGB(255, 255, 87, 65),
                  Color.fromARGB(255, 254, 137, 79),
                  Color.fromARGB(255, 255, 172, 88),
                ],
              ),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: user.profilePicture == null
              ? null
              : Image.network(user.profilePicture!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
