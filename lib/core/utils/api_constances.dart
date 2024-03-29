class ApiConstants {
  static const baseURL = 'https://api.themoviedb.org/3/';
  static const endPointPlayingNow = 'movie/now_playing';
  static const endPointPopular = 'movie/popular';
  static const endPointTopRated = 'movie/top_rated';
  static const endPointSearch = 'search/movie';
  static const endPointOnTheAirTv = 'tv/on_the_air';
  static const endPointPopularTv = 'tv/popular';
  static const endPointTopRatedTv = 'tv/top_rated';
  static const apiKey = '6c964a6f9febfdb19b92ce80e5b6620a';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String getImageUrl(String imagePath) => baseImageUrl + imagePath;
  static String getMovieDetailsPath(int movieId) =>
      '${baseURL}movie/${movieId.toString()}';
  static String getMovieRecommendationsPath(int movieId) =>
      '${baseURL}movie/${movieId.toString()}/recommendations';
  static String get getMovieSearch => baseURL + endPointSearch;
  static String get getTvOnTheAirUrl => baseURL + endPointOnTheAirTv;
  static String get getTvPopularUrl => baseURL + endPointPopularTv;
  static String get getTvTopRatedUrl => baseURL + endPointTopRatedTv;
  static String getTvDetails(int tvId) => '${baseURL}tv/${tvId.toString()}';
  static String getTvEpisodes({required int movieId, required seasonNumber}) =>
      '${baseURL}tv/${movieId.toString()}/season/${seasonNumber.toString()}';
  static String getTvRecommendation(int movieId) =>
      '${baseURL}tv/${movieId.toString()}/recommendations';
}
//https://api.themoviedb.org/3/movie/616820?api_key=6c964a6f9febfdb19b92ce80e5b6620a
//https://api.themoviedb.org/3/movie/now_playing?api_key=6c964a6f9febfdb19b92ce80e5b6620a
