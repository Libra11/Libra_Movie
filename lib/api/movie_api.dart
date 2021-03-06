import 'package:flustars/flustars.dart';
import 'package:libra_movie/common/common.dart';
import 'package:libra_movie/models/cast_model.dart';
import 'package:libra_movie/models/genre_model.dart';
import 'package:libra_movie/models/movie_detail_model.dart';
import 'package:libra_movie/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:libra_movie/models/person_detail.dart';
import 'package:libra_movie/models/person_model.dart';
import 'package:libra_movie/models/person_video_model.dart';
import 'package:libra_movie/models/video_model.dart';

class MovieApi {
  final String apiKey = "4e3aff24e8a43ae7d0fda09987f47fe3";
  static String mainUrl = 'https://api.themoviedb.org/3';
  String getPopularUrl = '/movie/popular';
  String getTopRatedUrl = '/movie/top_rated';
  String getUpcomingUrl = '/movie/upcoming';
  String getPlayingUrl = '/movie/now_playing';
  String getMoviesUrl = '/discover/movie';
  String getGenresUrl = '/genre/movie/list';
  String getPersonsUrl = '/trending/person/week';
  String getMovieUrl = '/movie';
  String getPersonDetailUrl = '/person';
  String getSearchMovieUrl = '/search/movie';
  String getDiscoverUrl = '/discover/movie';
  Dio dio;
  String language;
  MovieApi() {
    language = SpUtil.getString(Constant.language) == 'zh' ? 'zh' : 'en-US';
    BaseOptions options = new BaseOptions(
      baseUrl: mainUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
  }

  Future<MovieModel> getMovies({int page = 1}) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      'page': 1
    };
    try {
      Response response =
          await dio.request(getPopularUrl, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getTopRated({int page = 1}) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      'page': 1
    };
    try {
      Response response =
          await dio.request(getTopRatedUrl, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getNowPalying({int page = 1}) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      'page': page
    };
    try {
      Response response =
          await dio.request(getPlayingUrl, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<PersonModel> getPersons({int page = 1}) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      'page': page
    };
    try {
      Response response =
          await dio.request(getPersonsUrl, queryParameters: params);
      return PersonModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getUpcoming() async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      'page': 1
    };
    try {
      Response response =
          await dio.request(getUpcomingUrl, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<GenreModel> getGenre() async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response =
          await dio.request(getGenresUrl, queryParameters: params);
      return GenreModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getMovieByGenreId(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      "with_genres": id
    };
    try {
      Response response =
          await dio.request(getMoviesUrl, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response =
          await dio.request('$getMovieUrl/$id', queryParameters: params);
      return MovieDetail.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<CastModel> getCasts(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response = await dio.request('$getMovieUrl/$id/credits',
          queryParameters: params);
      return CastModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getSimilarMovie(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response = await dio.request('$getMovieUrl/$id/similar',
          queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<VideoModel> getVideos(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response =
          await dio.request('$getMovieUrl/$id/videos', queryParameters: params);
      return VideoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<PersonDetail> getPersonDetail(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response =
          await dio.request('$getPersonDetailUrl/$id', queryParameters: params);
      return PersonDetail.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<PersonVideoModel> getPersonVideo(int id) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
    };
    try {
      Response response = await dio.request(
          '$getPersonDetailUrl/$id/movie_credits',
          queryParameters: params);
      return PersonVideoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getSearchMovie(String query) async {
    Map<String, Object> params = {
      'api_key': apiKey,
      'language': language,
      'query': query
    };
    try {
      Response response =
          await dio.request(getSearchMovieUrl, queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }

  Future<MovieModel> getFilterMovie({
    String sortBy,
    int page = 1,
    String releaseDateGte,
    String releaseDateLte,
    int voteCount,
    double voteAverageGte,
    double voteAverageLte,
    String genres,
    int runtimeGte,
    int runtimeLte,
  }) async {
    try {
      Response response = await dio.request(
          "$getDiscoverUrl?api_key=$apiKey&language=$language&page=$page&sort_by=$sortBy&primary_release_date.gte=$releaseDateGte&primary_release_date.lte=$releaseDateLte&vote_count.gte=$voteCount&vote_average.gte=$voteAverageGte&vote_average.lte=$voteAverageLte&with_genres=$genres&with_runtime.gte=$runtimeGte&with_runtime.lte=$runtimeLte");
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stacktrace: $stacktrace');
      return null;
    }
  }
}
