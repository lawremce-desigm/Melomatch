// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:shazamclome/services/models/deezer_song_model.dart';

class SongService {
  Dio _dio;

  SongService()
      : _dio = Dio(BaseOptions(
            receiveTimeout: Duration(milliseconds: 10000),
            connectTimeout: Duration(milliseconds: 10000),
            baseUrl: 'https://api.deezer.com/track/')) {
    // You can also perform additional setup here if needed.
  }

  Future<Deezersongmodel?> getTrack(id) async {
    try {
      final response = await _dio.get('$id',
          options: Options(headers: {
            'Content-type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8'
          }));
      Deezersongmodel result = Deezersongmodel.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.requestOptions != null) {
        RequestOptions requestOptions = e.requestOptions!;
        print('Request URL: ${requestOptions.uri}');
      }
      throw 'an error has occurred';
    }

    // Return null in case of an error
    return null;
  }
}
