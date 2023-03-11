import 'package:layouts_app/models/post.dart';
import 'package:uuid/uuid.dart';

import 'gender.dart';

class User {
  final String id = const Uuid().v1();
  String name;
  final String tagName;
  String? location;
  Gender? gender;
  String? bio;
  String? profilePicture;
  List<User> followers;
  List<User> following;
  List<Post> posts;
  List<Post> stories;

  User(
      {required this.name,
      required this.tagName,
      this.location,
      this.gender,
      this.bio,
      this.profilePicture,
      List<User>? followers,
      List<User>? following,
      List<Post>? posts,
      List<Post>? stories})
      : followers = followers ?? [],
        following = following ?? [],
        posts = posts ?? [],
        stories = stories ?? [];
}
