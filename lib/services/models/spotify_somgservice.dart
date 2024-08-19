import 'package:dio/dio.dart';

class SpotifyApiService {
  Dio _dio;

  SpotifyApiService()
      : _dio = Dio(BaseOptions(
            receiveTimeout: Duration(milliseconds: 10000),
            connectTimeout: Duration(milliseconds: 10000),
            baseUrl: 'https://api.spotify.com/v1/')) {
    // You can also perform additional setup here if needed.
  }

  Future<String?> getAlbumCover(String albumId, String accessToken) async {
    try {
      final response = await _dio.get('albums/$albumId',
          options: Options(headers: {
            'Content-type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8',
            'Authorization': 'Bearer $accessToken', // Include the access token
          }));

      // Extract the album cover image URL from the response
      final imageUrl = response.data['images'][0]['url'];
      return imageUrl;
    } on DioError catch (e) {
      if (e.response != null) {
        Response response = e.response!;
        print('Request failed with status: ${response.statusCode}');
      }
      throw 'An error has occurred';
    }
  }
}
