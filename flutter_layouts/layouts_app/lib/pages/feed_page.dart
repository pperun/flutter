import 'package:flutter/material.dart';
import 'package:layouts_app/widgets/post_widget.dart';
import 'package:layouts_app/widgets/story_widget.dart';

import '../data.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../widgets/user_icon.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FeedPage> {
  static List<User> users = Data.getUsers();
  static List<Post> posts =
      users.map((e) => e.posts).reduce((list1, list2) => list1 + list2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('MyInstagram', style: TextStyle(fontFamily: 'BillaBong', fontSize: 32)),
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.favorite_border, size: 32),
                  Icon(Icons.near_me_outlined, size: 32),
                ],
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 3)],
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 14, right: 14),
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) =>
                    StoryWidget(user: users[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemBuilder: (context, index) => PostWidget(
                    user: users
                        .firstWhere((element) => element.id == posts[index].id),
                    post: posts[index]),
                itemCount: posts.length),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Icon(
              Icons.home_sharp,
              size: 32,
            ),
            const Icon(
              Icons.search,
              size: 32,
            ),
            const Icon(
              Icons.add_box_outlined,
              size: 32,
            ),
            const Icon(
              Icons.video_collection_outlined,
              size: 32,
            ),
            UserIcon(
              user: Data.getUser(),
              width: 32,
              height: 32,
            ),
          ]),
        ),
      ),
    );
  }
}
