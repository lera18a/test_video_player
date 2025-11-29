part of 'video_bloc.dart';

sealed class VideoState {}

class VideoLoadingState extends VideoState {}

class VideoPlayState extends VideoState {
  final bool onTap;
  final VideoPlayerController controller;

  final Duration position;
  VideoPlayState({
    required this.onTap,
    required this.controller,
    required this.position,
  });
}
