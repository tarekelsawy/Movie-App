class Constances {
  static const baseURL = 'https://api.themoviedb.org/3/';
  static const endPointPlayingNow = 'movie/now_playing';
  static const endPointPopular = 'movie/popular';
  static const endPointTopRated = 'movie/top_rated';
  static const apiKey = '6c964a6f9febfdb19b92ce80e5b6620a';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String  getUrl(String imagePath) => baseImageUrl+imagePath;
}
//https://api.themoviedb.org/3/movie/now_playing?api_key=6c964a6f9febfdb19b92ce80e5b6620a