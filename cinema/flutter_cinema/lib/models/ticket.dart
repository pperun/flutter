class Ticket {
  final int id;
  final int movieId;
  final String name;
  final DateTime date;
  final String image;
  final String smallImage;

  Ticket(
    this.id,
    this.movieId,
    this.name,
    this.date,
    this.image,
    this.smallImage,
  );

  Ticket.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        movieId = json['movieId'],
        name = json['name'],
        date = DateTime.fromMillisecondsSinceEpoch(
          json['date'] * 1000,
        ),
        image = json['image'],
        smallImage = json['smallImage'];

  Map<String, dynamic> toJSon() => {
        'id': id,
        'movieId': movieId,
        'name': name,
        'date': date.millisecondsSinceEpoch,
        'image': image,
        'smallImage': smallImage,
      };
}
