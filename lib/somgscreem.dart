import 'dart:ui' as ui;

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DetectedSongScreen extends ConsumerWidget {
  final SongModel? song;

  DetectedSongScreen({Key? key, @required this.song}) : super(key: key);

  Future<void> launchSpotify(String songId) async {
    final Uri spotifyUrl = Uri.parse('https://open.spotify.com/track/$songId');
    if (!await launchUrl(spotifyUrl)) {
      print('Could not launch $spotifyUrl');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color darkColor = const Color.fromARGB(255, 41, 0, 32);
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const ui.Color.fromARGB(0, 0, 0, 0),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/re.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ), // Adjust the sigma values for more or less blur
            child: Container(
              color: Colors
                  .transparent, // This is necessary for the blur effect to work
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/re.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              (song?.metadata?.music?.first.externalMetadata
                                      ?.spotify?.track?.name ??
                                  'Oops! Could Not Find Song') as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (song?.metadata?.music?.first.artists?.first
                                      .name ??
                                  'Something Went Wrong') as String,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                  onTap: () {
                    String? songId = song?.metadata?.music?.first
                        .externalMetadata?.spotify?.track!.id;
                    if (songId != null) {
                      // Do something with the non-null songId
                      launchSpotify(songId);
                    } else {
                      // Song is not detected, navigate to the home page
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: darkColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            song?.metadata?.music?.first.externalMetadata
                                        ?.spotify?.track?.name ==
                                    null
                                ? 'lib/assets/Restart.png'
                                : 'lib/assets/Spotify.png',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            (song?.metadata?.music?.first.externalMetadata
                                        ?.spotify?.track?.name ==
                                    null
                                ? 'Please, Try Again'
                                : 'Open On Spotify') as String,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
