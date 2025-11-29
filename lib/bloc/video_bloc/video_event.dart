part of 'video_bloc.dart';

sealed class VideoEvent {}

class VideoInitEvent extends VideoEvent {}

class VideoPlayEvent extends VideoEvent {}

class VideoDateEvent extends VideoEvent {}
