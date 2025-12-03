import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:test_video_player/bloc/video_nav_bloc/video_nav_bloc.dart';
import 'package:test_video_player/bloc/volume_bloc/volume_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatelessWidget {
  const VideoPlay({super.key, required this.controller});

  final VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    final volumeState = context.watch<VolumeBloc>().state;
    return BlocListener<VideoBloc, VideoState>(
      listener: (context, state) {
        if (state is VideoPlayState && controller != null) {
          if (state.onTap) {
            controller!.play();
          } else {
            controller!.pause();
          }
        }
      },
      child: GestureDetector(
        onTap: () => context.read<VideoNavBloc>().add(ShowNavEvent()),
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(
            controller!..setVolume(volumeState.isMuted ? 0.0 : 1.0),
          ),
        ),
      ),
    );
  }
}
