import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/settings_bloc/settings_bloc.dart';

class SettingsIcon extends StatefulWidget {
  const SettingsIcon({super.key});

  @override
  State<SettingsIcon> createState() => _SettingsIconState();
}

class _SettingsIconState extends State<SettingsIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<SettingsBloc>().add(SettingsTapEvent());
          },
          icon: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Color(0x80E0E7FF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.settings),
          ),
        );
      },
    );
  }
}
