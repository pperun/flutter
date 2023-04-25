class Movie {
  final int id;
  final String name;
  final String age;
  final String trailer;
  final String image;
  final String smallImage;
  final String originalName;
  final Duration duration;
  final String language;
  final double rating;
  final DateTime year;
  final String country;
  final String genre;
  final String plot;
  final String starring;
  final String director;
  final String screenWriter;
  final String studio;

  Movie(
      this.id,
      this.name,
      this.age,
      this.trailer,
      this.image,
      this.smallImage,
      this.originalName,
      this.duration,
      this.language,
      this.rating,
      this.year,
      this.country,
      this.genre,
      this.plot,
      this.starring,
      this.director,
      this.screenWriter,
      this.studio);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['data']['id'],
        name = json['data']['name'],
        age = json['data']['age'],
        trailer = json['data']['trailer'],
        image = json['data']['image'],
        smallImage = json['data']['smallImage'],
        originalName = json['data']['originalName'],
        duration = Duration(minutes: json['data']['duration']),
        language = json['data']['language'],
        rating = json['data']['rating'],
        year = json['data']['year'],
        country = json['data']['country'],
        genre = json['data']['genre'],
        plot = json['data']['plot'],
        starring = json['data']['starring'],
        director = json['data']['director'],
        screenWriter = json['data']['screenWriter'],
        studio = json['data']['studio'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'trailer': trailer,
        'image': image,
        'smallImage': smallImage,
        'originalName': originalName,
        'duration': duration.inMinutes,
        'language': language,
        'rating': rating,
        'year': year,
        'country': country,
        'genre': genre,
        'plot': plot,
        'starring': starring,
        'director': director,
        'screenWriter': screenWriter,
        'studio': studio,
      };
}
