import 'package:bloc/bloc.dart';

part 'volume_event.dart';
part 'volume_state.dart';

class VolumeBloc extends Bloc<VolumeEvent, VolumeState> {
  VolumeBloc() : super(VolumeState(isMuted: false)) {
    on<VolumeEvent>(_onVolumeEvent);
  }

  Future<void> _onVolumeEvent(
    VolumeEvent event,
    Emitter<VolumeState> emit,
  ) async {
    emit(VolumeState(isMuted: !state.isMuted));
  }
}
