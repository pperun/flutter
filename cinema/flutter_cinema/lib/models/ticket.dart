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
      : id = json['data']['id'],
        movieId = json['data']['movieId'],
        name = json['data']['name'],
        date = DateTime.fromMillisecondsSinceEpoch(
          json['data']['date'],
        ),
        image = json['data']['image'],
        smallImage = json['data']['smallImage'];

  Map<String, dynamic> toJSon() => {
        'id': id,
        'movieId': movieId,
        'name': name,
        'date': date.millisecondsSinceEpoch,
        'image': image,
        'smallImage': smallImage,
      };
}
