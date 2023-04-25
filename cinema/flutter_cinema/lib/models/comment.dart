class Comment {
  final int id;
  final String author;
  final String content;
  final int rating;

  Comment(this.id, this.author, this.content, this.rating);

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['data']['id'],
        author = json['data']['author'],
        content = json['data']['content'],
        rating = json['data']['rating'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'content': content,
        'rating': rating,
      };
}
