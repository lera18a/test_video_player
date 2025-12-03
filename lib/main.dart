import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/api/mock_video_api.dart';
import 'package:test_video_player/bloc/data_bloc/data_bloc.dart';
import 'package:test_video_player/bloc/settings_bloc/settings_bloc.dart';
import 'package:test_video_player/bloc/theme_bloc/theme_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:test_video_player/bloc/video_nav_bloc/video_nav_bloc.dart';
import 'package:test_video_player/bloc/volume_bloc/volume_bloc.dart';
import 'package:test_video_player/ui/logic_ui/app_orientation.dart';
import 'package:test_video_player/ui/logic_ui/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    RepositoryProvider<MockVideoApi>(
      create: (_) => MockVideoApi(),

      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingsBloc()),
          BlocProvider(create: (context) => ThemeBloc()),

          BlocProvider(
            create: (context) => DataBloc(context.read<MockVideoApi>()),
          ),
          BlocProvider(create: (context) => VolumeBloc()),
          BlocProvider(create: (context) => VideoNavBloc()),
          BlocProvider(create: (context) => VideoBloc()),
        ],
        child: AppTheme(child: AppOrientation()),
      ),
    ),
  );
}
