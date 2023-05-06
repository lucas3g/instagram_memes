import 'package:flutter/material.dart';
import 'package:instagram_memes/core_module/services/themeMode/theme_mode_controller.dart';
import 'package:instagram_memes/utils/constants.dart';
import 'package:video_player/video_player.dart';

class CardVideoWidget extends StatefulWidget {
  const CardVideoWidget({super.key});

  @override
  State<CardVideoWidget> createState() => _CardVideoWidgetState();
}

class _CardVideoWidgetState extends State<CardVideoWidget> {
  late VideoPlayerController _controller;
  late bool volumeOn = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/dog.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      })
      ..setVolume(0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void playOrPauseVideo() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appStore = ThemeModeController.appStore;

    return Container(
      padding: const EdgeInsets.only(
        top: kPadding,
        left: kPadding,
        right: kPadding,
      ),
      decoration: BoxDecoration(
        color: appStore.themeMode.value == ThemeMode.dark
            ? context.myTheme.onPrimary
            : context.myTheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: playOrPauseVideo,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Titulo do video',
            style: context.textTheme.bodyLarge!.copyWith(
              color: appStore.themeMode.value == ThemeMode.dark
                  ? Colors.white
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: appStore.themeMode.value == ThemeMode.dark
                ? Colors.white
                : Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.file_download_rounded,
                  color: appStore.themeMode.value == ThemeMode.dark
                      ? Colors.white
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share_rounded,
                  color: appStore.themeMode.value == ThemeMode.dark
                      ? Colors.white
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  !volumeOn
                      ? _controller.setVolume(5)
                      : _controller.setVolume(0);

                  setState(() {
                    volumeOn = !volumeOn;
                  });
                },
                icon: Icon(
                  !volumeOn ? Icons.volume_off : Icons.volume_up_rounded,
                  color: appStore.themeMode.value == ThemeMode.dark
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
