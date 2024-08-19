import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shazamclome/somgscreem.dart';
import 'package:shazamclome/themeprovider.dart';
import 'package:shazamclome/viewmodels/home_viewmodel.dart';

class Homepage extends ConsumerWidget {
  Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModel);
    final isDarkMode = ref.watch(themeProvider);

    ref.listen(homeViewModel, (pref, ext) {
      if (!ext.isRecognizing) {
        SongModel? currentSong = ext.currentSong;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetectedSongScreen(
              song: currentSong,
            ),
          ),
        );
      }
    });

    Color myColor = const Color.fromARGB(255, 255, 0, 199);
    Color darkColor = const Color.fromARGB(255, 41, 0, 32);
    return Scaffold(
      backgroundColor: isDarkMode ? darkColor : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Row(
              children: [
                SvgPicture.asset('lib/assets/vgmeol2.svg'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Melo-Match',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : darkColor,
                      fontFamily: 'urbanist',
                      fontSize: 16),
                )
              ],
            ),
          ),
          backgroundColor: isDarkMode ? darkColor : Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white : Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isDarkMode) {
                        ref.read(themeProvider.notifier).toggleTheme();
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isDarkMode ? Colors.transparent : darkColor),
                      child: Center(
                          child: Text(
                        'Light',
                        style: TextStyle(
                            color: isDarkMode ? darkColor : Colors.white,
                            fontSize: 12),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!isDarkMode) {
                        ref.read(themeProvider.notifier).toggleTheme();
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isDarkMode ? darkColor : Colors.transparent),
                      child: Center(
                        child: Text(
                          'Dark',
                          style: TextStyle(
                              color: isDarkMode ? Colors.white : darkColor,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'Tap to Record And Find Song',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                  ),
                ),
                AvatarGlow(
                  repeat: true,
                  repeatPauseDuration: Duration(milliseconds: 0),
                  duration: Duration(milliseconds: 1000),
                  showTwoGlows: true,
                  animate: vm.isRecognizing,
                  endRadius: 120,
                  glowColor: isDarkMode ? Colors.grey : myColor,
                  child: GestureDetector(
                    onTap: () async {
                      if (vm.isRecognizing) {
                        vm.stopRecognizing();
                      } else {
                        await vm.startRecognizing(context);
                      }
                    },
                    child: Material(
                      shape: CircleBorder(),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(40),
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDarkMode ? Colors.white : darkColor,
                        ),
                        child: SvgPicture.asset(
                          'lib/assets/Music note.svg',
                          color: isDarkMode ? darkColor : Colors.white,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
