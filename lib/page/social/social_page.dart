import 'package:awake_life/base/base.dart';
import 'package:awake_life/generated/l10n.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SocialPage extends BasePage {
  SocialPage({Key? key}) : super(bloc: SocialBloc());
  static const routeName = '/SocialPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _SocialPageState();
}

class _SocialPageState extends BasePageState<SocialPage> {
  late YoutubePlayerController youtubePlayerController;
  final url = 'https://www.youtube.com/watch?v=sc3L19mKUWs';

  @override
  void onCreate() {
    initVideo();
  }

  @override
  void onDestroy() {
    youtubePlayerController.dispose();
  }

  @override
  void deactivate() {
    youtubePlayerController.pause();
    super.deactivate();
  }

  void initVideo() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
      ),
      builder: (context, player) {
        return Scaffold(
          body: Container(
            height: ScreenUtil.getInstance().screenHeight,
            width: ScreenUtil.getInstance().screenWidth,
            padding:
                EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(16)),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil.getInstance().getAdapterSize(50),
                ),
                Text(
                  S.current.social,
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getAdapterSize(25),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().getAdapterSize(30),
                ),
                player
              ],
            ),
          ),
        );
      },
    );
  }
}
