import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/settings_bloc/settings_bloc.dart';
import 'package:test_video_player/ui/pages/fullscreen_video_page.dart';
import 'package:test_video_player/ui/ui_models/like_or_dislike_icon.dart';
import 'package:test_video_player/ui/ui_models/settings_icon.dart';
import 'package:test_video_player/ui/ui_models/switch_theme.dart';
import 'package:test_video_player/ui/pages/video_page.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        if (!isPortrait) {
          return FullScreenVideoPage();
        }
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: .end,
                      mainAxisSize: .min,
                      children: [
                        SettingsIcon(),
                        Stack(
                          alignment: .topRight,
                          children: [
                            VideoPage(),
                            Column(
                              mainAxisSize: .min,
                              mainAxisAlignment: .end,
                              children: [
                                BlocBuilder<SettingsBloc, SettingsState>(
                                  builder: (context, state) {
                                    if (!state.onTap) {
                                      return SizedBox();
                                    } else {
                                      return SwitchThemeSettings();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28),
                  Expanded(
                    child: Padding(
                      padding: .symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '20 век краткий пересказ ',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              LikeOrDislikeIcon(
                                onPressed: () {},
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(18),
                                ),
                                icon: VideoPlayerIcons.like,
                              ),
                              LikeOrDislikeIcon(
                                onPressed: () {},
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(18),
                                ),
                                icon: VideoPlayerIcons.dislike,
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: ListView(
                                padding: .all(0),
                                children: [
                                  Text(
                                    '20 век краткий пересказ ',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '20 век краткий пересказ ',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '20 век краткий пересказ ',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '20 век краткий пересказ ',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '20 век краткий пересказ ',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '''Список источников и литературы:
          1. Положение о социалистическом землеустройстве и о мерах перехода к социалистическому земледелию
          2. Трагедия советской деревни. Коллективизация и раскулачивание. 1927—1939. В 5 т. Т. 1. Май 1927 — ноябрь 1929
          3. Кондрашин В.В. Голод 1932-1933 годов. - М., РОССПЭН, 2008
          4. Поездка в Сибирь. Сталин. Жизнь одного вождя
          5. В.А.Ильиных Хроники хлебного фронта
          6. Дэвис Р.; Уиткрофт С. Годы голода: сельское хозяйство СССР, 1931–1933.
          7. Сталин И.В. Год великого перелома: К ХII годовщине Октября''',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
