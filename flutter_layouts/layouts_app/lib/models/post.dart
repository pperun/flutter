import 'package:layouts_app/models/post_type.dart';

class Post {
  final String id;
  String? location;
  String? content;
  List<String> contentLinks;
  int likesCounter;
  int commentsCounter;
  final PostType type;

  Post({
    required this.id,
    required this.type,
    this.location,
    this.content,
    required this.contentLinks,
    required this.likesCounter,
    required this.commentsCounter,
  });
}
