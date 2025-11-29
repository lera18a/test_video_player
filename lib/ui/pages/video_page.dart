import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/volume_bloc/volume_bloc.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_nav.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_play.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_slider.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  Future<void> _goFullScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VolumeBloc, VolumeState>(
      builder: (context, state) {
        return Column(
          children: [
            Stack(alignment: .center, children: [VideoPlay(), VideoNav()]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 44,
                  child: Row(
                    children: [
                      Expanded(child: VideoSlider()),
                      SizedBox(width: 12),
                      EntitiesIcon(
                        onPressed: () {
                          context.read<VolumeBloc>().add(VolumeEvent());
                        },
                        icon: state.isMuted
                            ? Icons.volume_off_rounded
                            : VideoPlayerIcons.volume,
                        size: 14.77,
                      ),
                      SizedBox(width: 12),
                      EntitiesIcon(
                        onPressed: _goFullScreen,
                        icon: VideoPlayerIcons.bigscreen,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
