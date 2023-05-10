class Movie {
  final int id;
  final String name;
  final int age;
  final String trailer;
  final String image;
  final String smallImage;
  final String originalName;
  final Duration duration;
  final String language;
  final double rating;
  final int year;
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
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        trailer = json['trailer'],
        image = json['image'],
        smallImage = json['smallImage'],
        originalName = json['originalName'],
        duration = Duration(minutes: json['duration']),
        language = json['language'],
        rating = double.tryParse(json['rating']) ?? 0.0,
        year = json['year'],
        country = json['country'],
        genre = json['genre'],
        plot = json['plot'],
        starring = json['starring'],
        director = json['director'],
        screenWriter = json['screenwriter'],
        studio = json['studio'];

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
