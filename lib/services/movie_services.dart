part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovies(int page, {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$api_key&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";
    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetail> getMovieDetail(Movie movie,
      {int movieId, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieId ?? movie.id}?api_key=$api_key&language=en-US";
    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];
    List<String> stringGenres = [];
    for (var i = 0; i < genres.length; i++) {
      String genre = genres[i]['name'];
      stringGenres.add(genre);
    }
    String ori_lang = (data as Map<String, dynamic>)['original_language'];
    String language = "";
    switch (ori_lang) {
      case 'ja':
        language = "Japanese";
        break;
      case 'id':
        language = "Indonesian";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }
    return movieId != null
        ? MovieDetail(Movie.fromJson(data),
            language: language, genres: stringGenres)
        : MovieDetail(movie, language: language, genres: stringGenres);
  }

  static Future<List<Credit>> getCredits(int movieID,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$api_key";

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}
