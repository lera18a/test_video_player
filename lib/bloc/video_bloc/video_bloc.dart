import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  late final VideoPlayerController _controller;

  VideoBloc() : super(VideoLoadingState()) {
    on<VideoPlayEvent>(_onVideoPlayEvent);
    on<VideoInitEvent>(_onVideoInitEvent);
    on<VideoDateEvent>(_onVideoDateEvent);
    add(VideoInitEvent());
  }

  Future<void> _onVideoInitEvent(
    VideoInitEvent event,
    Emitter<VideoState> emit,
  ) async {
    emit(VideoLoadingState());

    _controller = VideoPlayerController.asset('assets/tractor.mp4');
    await _controller.initialize();
    _controller.addListener(() {
      if (isClosed) return;
      add(VideoDateEvent());
    });

    emit(
      VideoPlayState(
        onTap: false,
        controller: _controller,
        position: Duration.zero,
      ),
    );
  }

  Future<void> _onVideoPlayEvent(
    VideoPlayEvent event,
    Emitter<VideoState> emit,
  ) async {
    if (state is! VideoPlayState) return;

    final current = state as VideoPlayState;
    if (current.onTap) {
      await current.controller.pause();
    } else {
      await current.controller.play();
    }

    emit(
      VideoPlayState(
        onTap: !current.onTap,
        controller: current.controller,
        position: current.position,
      ),
    );
  }

  void _onVideoDateEvent(VideoDateEvent event, Emitter<VideoState> emit) {
    if (state is! VideoPlayState) return;
    final current = state as VideoPlayState;
    final position = current.controller.value.position;
    final duration = current.controller.value.duration;

    if (duration != Duration.zero && position >= duration) {
      if (current.controller.value.isPlaying) {
        current.controller.pause();
      }
      emit(
        VideoPlayState(
          onTap: false, // значит в UI покажется иконка play
          controller: current.controller,
          position: duration,
        ),
      );
    } else {
      emit(
        VideoPlayState(
          onTap: current.onTap,
          controller: current.controller,
          position: current.controller.value.position,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    if (state is VideoPlayState) {
      await (state as VideoPlayState).controller.dispose();
    }
    return super.close();
  }
}
