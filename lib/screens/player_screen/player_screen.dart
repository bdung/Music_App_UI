import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/model/music_model.dart';
import 'package:music_app/screens/list_music/list_music.dart';
import 'package:music_app/screens/player_screen/components/button_and_icon.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.size});
  final Size size;
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int _currentItemPlaying = 0;
  double _currentPlayBack = 0;
  bool isPlaying = false;

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;
   var duration = 0;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.open(
        Audio.network(musicList[_currentItemPlaying]
            .audioUrl), //Audio('assets/images/audio.mp3'),
        autoStart: isPlaying,
        showNotification: true);
    
    audioPlayer.current.listen((playingAudio) {
      songDuration =
          formatePlayertime(playingAudio!.audio.duration.inSeconds * 1.0);
    });
  }

  // Duration duration = new Duration();
  Duration position = new Duration();

  late String songDuration = '0';

  String formatePlayertime(double time) {
    final min = time ~/ 60;
    final sec = time % 60;
    return "$min:${sec.toStringAsFixed(0)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonAndIcon(
                  size: 50,
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.bgDark,
                  ),
                ),
                Text(
                  "PLAYING now".toUpperCase(),
                  style: const TextStyle(
                      color: AppColor.bgDark, fontWeight: FontWeight.bold),
                ),
                ButtonAndIcon(
                  size: 50,
                  child: Icon(
                    Icons.menu,
                    color: AppColor.bgDark,
                  ),
                  onPressed: () async {
                    int selectedIndex = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListMusicScreen(
                                  selectedIndex: _currentItemPlaying,
                                )));
                    setState(() {
                      _currentItemPlaying = selectedIndex;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: widget.size.height * 0.08,
            ),
            ButtonAndIcon(
              size: 280,
              imageUrl: musicList[_currentItemPlaying].imageUrl,
              distance: 20,
            ),
            SizedBox(
              height: widget.size.height * 0.02,
            ),
            Text(
              musicList[_currentItemPlaying].name,
              style: const TextStyle(
                  fontSize: 25,
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              musicList[_currentItemPlaying].artist,
              style: const TextStyle(
                  fontSize: 14,
                  color: AppColor.secondaryTextColor,
                  fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatePlayertime(_currentPlayBack),
                    style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    songDuration,
                    style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Slider(
                value: _currentPlayBack,
                min: 0,
                max: musicList[_currentItemPlaying].length,
                thumbColor: AppColor.blue,
                activeColor: AppColor.blue,
                inactiveColor: AppColor.bgDark,
                onChanged: (value) {
                  setState(() {
                    _currentPlayBack = value;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonAndIcon(
                  onPressed: () {
                    if (_currentItemPlaying == 0)
                      _currentItemPlaying = musicList.length;

                    setState(() {
                      _currentItemPlaying--;
                      audioPlayer.open(
                          Audio.network(musicList[_currentItemPlaying]
                              .audioUrl), //Audio('assets/images/audio.mp3'),
                          autoStart: isPlaying,
                          showNotification: true);
                      audioPlayer.current.listen((playingAudio) {
                        songDuration = formatePlayertime(
                            playingAudio!.audio.duration.inSeconds * 1.0);
                      });
                    });
                  },
                  size: 60,
                  child: Icon(
                    Icons.skip_previous,
                    color: AppColor.bgDark,
                  ),
                ),
                ButtonAndIcon(
                  onPressed: () async {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                    PlayTheSong();
                  },
                  size: 60,
                  colors: [AppColor.blueTopDark, AppColor.blue],
                  child: isPlaying == true
                      ? Icon(
                          Icons.pause,
                          color: AppColor.white,
                        )
                      : Icon(
                          Icons.play_arrow,
                          color: AppColor.white,
                        ),
                ),
                ButtonAndIcon(
                  size: 60,
                  onPressed: () {
                    if (_currentItemPlaying == musicList.length - 1)
                      _currentItemPlaying = -1;

                    setState(() {
                      _currentItemPlaying++;
                      audioPlayer.current.listen((playingAudio) {
                        songDuration = formatePlayertime(
                            playingAudio!.audio.duration.inSeconds * 1.0);
                      });
                      audioPlayer.open(
                          Audio.network(musicList[_currentItemPlaying]
                              .audioUrl), //Audio('assets/images/audio.mp3'),
                          autoStart: isPlaying,
                          showNotification: true);
                    });
                  },
                  child: Icon(
                    Icons.skip_next,
                    color: AppColor.bgDark,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  void PlayTheSong() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        audioPlayer.play();
      } else {
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }
}
