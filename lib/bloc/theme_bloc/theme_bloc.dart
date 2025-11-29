import 'package:bloc/bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDark: true)) {
    on<ToggleThemeEvent>(_onToggleThemeEvent);
  }

  Future<void> _onToggleThemeEvent(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final finalState = !state.isDark;
    emit(ThemeState(isDark: finalState));
  }
}
