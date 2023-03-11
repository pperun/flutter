import 'package:flutter/material.dart';
import 'package:layouts_app/widgets/user_icon.dart';

import '../models/post.dart';
import '../models/post_type.dart';
import '../models/user.dart';

class PostWidget extends StatelessWidget {
  final User user;
  final Post post;

  PostWidget({super.key, required this.user, required this.post})
      : assert(post.type == PostType.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserIcon(
                    user: user,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 160,
                    child: Text(
                      user.tagName,
                      style: const TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          child: post.contentLinks.isNotEmpty
              ? Image.network(post.contentLinks[0])
              : Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                  ),
                ),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.favorite_border, size: 32),
                    Icon(Icons.mode_comment_outlined, size: 32),
                    Icon(Icons.near_me_outlined, size: 32),
                  ],
                ),
              ),
              const Icon(Icons.bookmark_border_sharp, size: 32),
            ],
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 0, bottom: 10, left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Likes: ${post.likesCounter}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${user.tagName} ${post.content}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
