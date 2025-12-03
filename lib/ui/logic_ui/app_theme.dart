import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/theme_bloc/theme_bloc.dart';
import 'package:test_video_player/theme/theme.dart';
import 'package:test_video_player/ui/logic_ui/app_orientation.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state.isDark ? ThemeMode.light : ThemeMode.dark,
          home: AppOrientation(),
        );
      },
    );
  }
}
