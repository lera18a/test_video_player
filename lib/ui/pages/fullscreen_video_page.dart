import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_nav.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_play.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_slider.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class FullScreenVideoPage extends StatelessWidget {
  const FullScreenVideoPage({super.key});

  Future<void> _goPortraitScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          child: Stack(
            alignment: .center,
            children: [
              const Positioned.fill(bottom: -26, child: VideoPlay()),
              Center(child: const VideoNav()),
              Positioned(
                bottom: 34.5,
                left: 16,
                right: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: const VideoSlider()),
                    const SizedBox(width: 24),
                    EntitiesIcon(
                      onPressed: _goPortraitScreen,
                      icon: VideoPlayerIcons.diagonal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
