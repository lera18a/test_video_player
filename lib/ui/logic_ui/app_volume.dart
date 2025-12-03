import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/volume_bloc/volume_bloc.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class AppVolume extends StatelessWidget {
  const AppVolume({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VolumeBloc, VolumeState>(
      builder: (context, state) {
        return EntitiesIcon(
          onPressed: () {
            context.read<VolumeBloc>().add(VolumeEvent());
          },
          icon: state.isMuted
              ? Icons.volume_off_rounded
              : VideoPlayerIcons.volume,
          size: 14.77,
        );
      },
    );
  }
}
