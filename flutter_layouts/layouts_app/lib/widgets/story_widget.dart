import 'package:flutter/material.dart';
import 'package:layouts_app/widgets/user_icon.dart';
import '../models/user.dart';

class StoryWidget extends StatelessWidget {
  bool seen;
  final User user;

  StoryWidget({super.key, required this.user, bool? seen})
      : seen = seen ?? false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: UserIcon(
            user: user,
            seen: seen,
            height: 60,
            width: 60,
          )),
          Text(
            user.tagName,
            style:
                const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
