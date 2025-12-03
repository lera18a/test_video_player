import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/data_bloc/data_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:test_video_player/ui/pages/fullscreen_video_page.dart';
import 'package:test_video_player/ui/pages/portrait_video_page.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_play_controller.dart';

class AppOrientation extends StatefulWidget {
  const AppOrientation({super.key});

  @override
  State<AppOrientation> createState() => _AppOrientationState();
}

class _AppOrientationState extends State<AppOrientation> {
  final videoControllerHolder = VideoPlayController();
  bool isInitialized = false;
  Duration _lastEmittedPosition = Duration.zero;
  final _minUpdateDifference = Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    final currentState = context.read<DataBloc>().state;

    if (currentState is DataLoadedVideo) {
      _initVideo(currentState.modelVideo.url);
    } else {
      context.read<DataBloc>().stream.listen((state) {
        if (state is DataLoadedVideo) {
          _initVideo(state.modelVideo.url);
        }
      });
    }
  }

  Future<void> _initVideo(String url) async {
    await videoControllerHolder.init(url);
    videoControllerHolder.controller?.addListener(() {
      final controller = videoControllerHolder.controller;
      if (controller != null && controller.value.isInitialized) {
        final currentPosition = controller.value.position;
        if (currentPosition - _lastEmittedPosition >= _minUpdateDifference ||
            currentPosition < _lastEmittedPosition) {
          _lastEmittedPosition = currentPosition;
          context.read<VideoBloc>().add(VideoPositionChanged(currentPosition));
        }
      }
    });

    if (mounted) {
      setState(() {
        isInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    videoControllerHolder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = videoControllerHolder.controller;
    final theme = Theme.of(context);

    if (!isInitialized ||
        controller == null ||
        !controller.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        return Scaffold(
          backgroundColor: isPortrait
              ? theme.scaffoldBackgroundColor
              : Colors.black,
          body: SafeArea(
            bottom: isPortrait,
            child: isPortrait
                ? PortraitVideoPage(controller: controller)
                : FullScreenVideoPage(controller: controller),
          ),
        );
      },
    );
  }
}
