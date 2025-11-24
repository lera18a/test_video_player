import 'package:bloc/bloc.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsTapEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(onTap: false)) {
    on<SettingsTapEvent>(_onSettingsTapEvent);
  }

  Future<void> _onSettingsTapEvent(
    SettingsTapEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final finalState = !state.onTap;
    emit(SettingsState(onTap: finalState));
  }
}
