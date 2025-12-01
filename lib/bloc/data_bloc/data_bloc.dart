import 'package:bloc/bloc.dart';
import 'package:test_video_player/api/mock_video_api.dart';
import 'package:test_video_player/api/model/model_video.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataInitialEvent, DataState> {
  final MockVideoApi mockVideoApi;
  DataBloc(this.mockVideoApi) : super(DataLoadingVideo()) {
    on<DataInitialEvent>(_onDataInitialEvent);
    add(DataInitialEvent());
  }

  Future<void> _onDataInitialEvent(
    DataInitialEvent event,
    Emitter<DataState> emit,
  ) async {
    emit(DataLoadingVideo());
    final respose = await mockVideoApi.fetchVideo();
    emit(DataLoadedVideo(modelVideo: respose));
  }
}
