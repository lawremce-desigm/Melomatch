import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shazamclome/services/song_service.dart';

class HomeViewModel extends ChangeNotifier {
  BuildContext? context;
  HomeViewModel() {
    initAcr();
  }

  final AcrCloudSdk acr = AcrCloudSdk();
  final SongService songService = SongService();
  SongModel? currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
          host: 'identify-eu-west-1.acrcloud.com',
          accessKey: 'ef6a1940b6a4111ecd2972dbfef42dc4',
          accessSecret: 'ET3Jd6HF2M7z1sBPLVY2yB1CQbiq4wDAkxKh0ljk',
          setLog: false,
        )
        ..songModelStream.listen(searchSong, onError: (_) {
          isRecognizing = false;
          success = false;
          notifyListeners();
        });
    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {
    print(song.metadata?.music?.first.title);

    final metaData = song.metadata;
    if (metaData != null && (metaData.music?.isNotEmpty ?? false)) {
      success = true;
      currentSong = song;
      isRecognizing = false;
      notifyListeners();
    } else {
      isRecognizing = false;
      success = false;
      notifyListeners();
    }
    // currentSong = song as Deezersongmodel?;
  }

  Future<void> startRecognizing(BuildContext context) async {
    this.context = context;
    isRecognizing = true;
    success = false;
    currentSong = null;
    notifyListeners();

    try {
      await acr.start();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    notifyListeners();
    try {
      await acr.stop();
    } catch (e) {
      print(e.toString());
    }
  }
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  print('>>> In homeViewModel');
  return HomeViewModel();
});
